class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password, length: {minimum: 6}

  has_many :created_lists, class_name: List, foreign_key: "creator_id"
  has_many :lists_contributed_to, through: :ballots, source: :list
  has_many :ballots, class_name: Ballot, foreign_key: "voter_id"
  has_many :votes, through: :ballots
  has_many :albums_voted_for, through: :votes, source: :album
  has_many :artists_voted_for, through: :albums_voted_for, source: :artist
end
