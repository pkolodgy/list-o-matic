class List < ActiveRecord::Base
  validates :name, presence: true
  validates :end_time, presence: true

  belongs_to :creator, class_name: User
end
