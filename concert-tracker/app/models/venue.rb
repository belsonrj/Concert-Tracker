class Venues < ActiveRecord::Base
  has_many :performer_venue
  has_many :performers, through: :performer_venue
  belongs_to :users
  
  def self.valid_params?(params)
    return !params[:name].blank? && !params[:city].blank?
  end
end