class User < ActiveRecord::Base
  has_many :check_ins
  has_many :businesses, through: :check_ins
end
