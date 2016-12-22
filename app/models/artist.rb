class Artist < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :albums
end
