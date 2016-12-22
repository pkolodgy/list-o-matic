class Vote < ActiveRecord::Base
  validates :points, presence: true
  validates :points, numericality: {only_integer:true, greater_than: 0}
  validates :album_id, uniqueness: {scope: [:ballot_id]}

  belongs_to :album
  belongs_to :ballot
  has_one :artist, through: :album
  has_one :voter, through: :ballot
  has_one :list, through: :ballot
end
