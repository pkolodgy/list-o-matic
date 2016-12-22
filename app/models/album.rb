class Album < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: [:artist_id]}

  belongs_to :artist
end
