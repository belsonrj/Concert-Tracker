class PerformerVenues < ActiveRecord::Base 
  belongs_to :performers
  belongs_to :venues
end