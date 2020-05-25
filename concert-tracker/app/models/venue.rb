class Venue < ActiveRecord::Base
  belongs_to :user
  has_many :performer_venues
  has_many :performers, through: :performer_venues
  
#  def self.performers
#    @performers = []
#  end
  
  def self.valid_params?(params)
    return !params[:name].blank? && !params[:city].blank?
  end
end