class Venues < ActiveRecord::Base
  has_many :performers
  belongs_to :user
  
  def self.valid_params?(params)
    return !params[:name].empty? && !params[:city].empty?
  end
end