class Ballot < ActiveRecord::Base
  validates :voter_id, uniqueness: {scope: [:list_id]}

  has_many :votes
  belongs_to :voter, class_name: User
  belongs_to :list
  has_many :albums, through: :votes
  has_many :artists, through: :albums,  source: :artist
end
