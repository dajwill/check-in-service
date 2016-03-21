class Business < ActiveRecord::Base
  has_many :check_ins
  has_many :rewards
end
