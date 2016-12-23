get '/lists' do
  @open_lists = List.where("end_time > ?", DateTime.now)
  @closed_lists = List.where("end_time < ?", DateTime.now)
  erb :'lists/index'
end

get '/lists/new' do
  erb :'lists/new'
end

post '/lists' do
  list = List.new(name: params[:name])
  list.end_time = DateTime.now + 7
  list.creator = current_user
  if list.save
    redirect "/lists/#{list.id}"
  else
    @errors = list.errors.full_messages
    erb :'lists/new'
  end
end

get '/lists/:id' do
  @list = List.find_by_id(params[:id])
  erb :'lists/show'
end

get '/lists/:list_id/ballots/new' do
  require_user
  @list = List.find_by_id(params[:list_id])
  erb :'ballots/new'
end

post '/lists/:list_id/ballots' do
  ballot = Ballot.new(voter: current_user, list: List.find_by_id(params[:list_id]))
  if ballot.save
    params[:artist].each do |key, artist|
      points = (params[:artist].length - key.to_i) + 1
      artist = Artist.find_or_create_by(name: artist)

      album = Album.find_or_create_by(title: params[:title][key], artist: artist)

      vote = Vote.new(album: album, ballot: ballot, points: points)
      if !vote.save
        @errors = ["Something went wrong"]
        erb :"lists/#{params[:list_id]}/ballots/new"
      end
    end
    redirect "/lists/#{params[:list_id]}"
  else
    @errors = ["You've already voted!"]
    erb :"lists/#{params[:list_id]}/ballots/new"
  end

end
