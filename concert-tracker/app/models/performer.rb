class Performer < ActiveRecord::Base
  belongs_to :user
  has_many :performer_venues
  has_many :venues, through: :performer_venues
#  accepts_nested_attributes_for :venues

  def self.venues
    @venues = []
  end
  
  def self.valid_params?(params)
    return !params[:name].blank? && !params[:genre].blank? && !params[:times_seen].blank?
  end
end