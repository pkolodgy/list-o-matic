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

  def get_results(limit=10)
    self.votes.group(:album_id).limit(limit).order('sum_points DESC').sum(:points)
  end

  def get_contributor_links
    self.ballots.inject([]) {|memo,ballot| memo << "<a href='/lists/#{self.id}/ballots/#{ballot.id}'>#{ballot.voter.username}</a>"}
  end

end
