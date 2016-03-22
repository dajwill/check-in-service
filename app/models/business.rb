class Business < ActiveRecord::Base
  has_many :check_ins
  has_many :rewards
  attr_reader :password_hash

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
