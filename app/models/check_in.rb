class CheckIn < ActiveRecord::Base
  belongs_to :user
  belongs_to :business

  validate :checked_in?

  def checked_in?
    if !CheckIn.where(business_id: business_id, user_id: user_id, business_code: business_code).empty?
      errors.add(:user, "has already checked in today")
    end
  end
end
