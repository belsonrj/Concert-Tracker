class User < ActiveRecord::Base
  has_secure_password
  has_many :performers
  has_many :venues
end