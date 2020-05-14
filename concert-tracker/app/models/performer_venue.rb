class PerformerVenue < ActiveRecord::Base 
  belongs_to :performers
  belongs_to :venues
end