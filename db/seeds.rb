albums = [["Royal Trux", "Accelerator"],  ["Summer Hits","Beaches and Canyons"], ["Yo La Tengo", "Painful"], ["Guided By Voices", "Alien Lanes"], ["Liz Phair", "Exile In Guyville"], ["The Pooh Sticks", "Formula One Generation"], ["Mountain Goats", "Zopilote Machine"], ["Charlie Mcalister", "Mississippi Luau"], ["Oblivians", "Popular Favorites"], ["The Softies", "It's Love"], ["The Cardigans", "First Band on the Moon"], ["Darcy Clay", "Jesus I Was Evil"], ["Don Lennon", "Maniac"], ["Saint Etienne", "Foxbase Alpha"]]

10.times do
  User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: Faker::Internet.password)
end

me = User.create(username: "patrick", email:"p@g.com", password:"hello22")

list = List.create(name: "Top 10 90s Albums", creator: me, end_time: DateTime.now - 1)

albums.each do |album|
  artist = Artist.find_or_create_by(name: album[0].downcase.gsub(/[^0-9a-z ]/i, ''))
  Album.find_or_create_by(title: album[1].downcase.gsub(/[^0-9a-z ]/i, ''), artist: artist)
end

User.all.each do |user|
  destroy = Album.all.to_a
  b = Ballot.create(list: list, voter: user)

  10.times do |i|
    Vote.create(album: destroy.shuffle.shift, ballot: b, points: (i+1))
  end
end

list = List.create(name: "Top 10 Albums of 2016", creator: me, end_time: DateTime.now + 7)

current_albums = [["Kero Kero Bonito","Bonito Generation"], ["Vanity", "Dont Be Shy"], ["JJ Doll", "Demo"], ["Lavender Flu", "Heavy Air"], ["HOOPS", "Tape 2"], ["CE Schneider Topical", "Antifree"], ["Katie Dey", "Flood Network"], ["Liquids", "Hot Liqs"], ["Tyvek", "Origin of What"], ["Angel", "2017"], ["Macula Dog", "Why Do You Look Like Your Dog"]]

current_albums.each do |album|
  artist = Artist.find_or_create_by(name: album[0].downcase.gsub(/[^0-9a-z ]/i, ''))
  Album.find_or_create_by(title: album[1].downcase.gsub(/[^0-9a-z ]/i, ''), artist: artist)
end

User.all.each do |user|
  destroy = Album.where('id > ?', 14)
  b = Ballot.create(list: list, voter: user)

  10.times do |i|
    Vote.create(album: destroy.shuffle.shift, ballot: b, points: (i+1))
  end
end
