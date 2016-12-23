class Album < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: [:artist_id]}

  belongs_to :artist
  has_many :votes
  has_many :ballots, through: :votes
  has_many :voters, through: :ballots, class_name: User
  has_many :lists_included_on, through: :ballots, source: :list

  def get_album_info
    url = "https://api.discogs.com/database/search?title=#{self.title}&artist=#{self.artist.name}&token=lhhQNoRfiuhEfSqmaijfiVbyYBNCJDedmspyODLb"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
