class Artist < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :albums
  has_many :votes, through: :albums
  has_many :ballots, through: :votes
  has_many :voters, through: :ballots, class_name: User
  has_many :lists_included_on, through: :ballots, source: :list
end
