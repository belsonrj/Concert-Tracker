class Performer < ActiveRecord::Base
  belongs_to :user
  belongs_to :venues
end