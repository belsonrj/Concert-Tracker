class PerformerVenue < ActiveRecord::Base 
#  attr_accessor :performer_id, :venue_id
  belongs_to :performer
  belongs_to :venue
#  has_many :performer_id
#  has_many :venue_id

end