class Performer < ActiveRecord::Base
  has_many :venues
  belongs_to :user
end