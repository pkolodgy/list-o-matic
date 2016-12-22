class List < ActiveRecord::Base
  validates :name, presence: true
  validates :end_time, presence: true

  belongs_to :creator, class_name: User
  has_many :ballots
  has_many :voters, through: :ballots, class_name: User
  has_many :votes, through: :ballots
  has_many :included_albums, through: :votes, source: :album
  has_many :included_artists, through: :included_albums, source: :artist

  def closed?
    self.end_time < DateTime.now
  end
  
end
