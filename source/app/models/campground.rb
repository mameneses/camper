class Campground < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :favorites

  validates :name, :state, presence: true
  validates :name, uniqueness: true
end
