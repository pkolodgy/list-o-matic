albums = [["Royal Trux", "Accelerator"],  ["Summer Hits","Beaches and Canyons"], ["Yo La Tengo", "Painful"], ["Guided By Voices", "Alien Lanes"], ["Liz Phair", "Exile In Guyville"], ["The Pooh Sticks", "Formula One Generation"], ["Mountain Goats", "Zopilote Machine"], ["Charlie Mcalister", "Mississippi Luau"], ["Oblivians", "Popular Favorites"], ["The Softies", "It's Love"], ["The Cardigans", "First Band on the Moon"], ["Darcy Clay", "Jesus I Was Evil"], ["Don Lennon", "Maniac"], ["Saint Etienne", "Foxbase Alpha"]]

10.times do
  User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: Faker::Internet.password)
end

list = List.create(name: "Top 5 Albums", creator: User.all.sample, end_time: DateTime.now + 7)

albums.each do |album|
  artist = Artist.find_or_create_by(name: album[0])
  Album.find_or_create_by(title: album[1], artist: artist)
end

User.all.each do |user|
  destroy = Album.all.to_a
  b = Ballot.create(list: list, voter: user)

  5.times do |i|
    Vote.create(album: destroy.shuffle.shift, ballot: b, points: (i+1))
  end
end
