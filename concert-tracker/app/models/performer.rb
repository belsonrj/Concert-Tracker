class Performers < ActiveRecord::Base
  belongs_to :user
  has_many :venues
  
  def self.valid_params?(params)
    return !params[:name].empty? && !params[:genre].empty?
  end
end