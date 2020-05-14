class Performers < ActiveRecord::Base
  belongs_to :user
  has_many :performer_venues
  has_many :venues, through: :performer_venue
  accepts_nested_attributes_for :venues
  
  def self.valid_params?(params)
    return !params[:name].blank? && !params[:genre].blank? && !params[:times_seen].blank?
  end
end