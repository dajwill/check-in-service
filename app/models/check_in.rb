class CheckIn < ActiveRecord::Base
  belongs_to :user
  belongs_to :business
  validates_presence_of :business_code
  validate :checked_in?

  def checked_in?
    unless CheckIn.where(business_id: business_id, user_id: user_id, business_code: business_code).empty?
      errors.add(:user_id, "has already checked in today")
    end
  end

  # def valid?
  #
  # end
end
