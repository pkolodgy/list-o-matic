get '/lists' do
  @lists = List.all
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
