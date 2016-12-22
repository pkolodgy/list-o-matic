class Album < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: [:artist_id]}

  belongs_to :artist
  has_many :votes
  has_many :ballots, through: :votes
  has_many :voters, through: :ballots, class_name: User
  has_many :lists_included_on, through: :ballots, source: :list
end
