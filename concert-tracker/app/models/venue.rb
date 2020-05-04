class Venue < ActiveRecord::Base
  has_many :performers
  belongs_to :user
end