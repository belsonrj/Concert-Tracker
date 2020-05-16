class Venue < ActiveRecord::Base
  has_many :performer_venues
  has_many :performers, through: :performer_venues
  belongs_to :user
  #accepts_nested_attributes_for :performers
  
  def self.performers
    @performers = []
  end
  
  def self.valid_params?(params)
    return !params[:name].blank? && !params[:city].blank?
  end
end