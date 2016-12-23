helpers do
  def get_album_info(album_title, artist_name)
    url = "https://api.discogs.com/database/search?title=#{album_title}&artist=#{artist_name}&token=lhhQNoRfiuhEfSqmaijfiVbyYBNCJDedmspyODLb"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
