class Venues < ActiveRecord::Base
  has_many :performers
  belongs_to :user
  
  def self.valid_params?(params)
    return !params[:name].blank? && !params[:city].blank?
  end
end