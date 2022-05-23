require 'bcrypt'
class Event < ApplicationRecord
  has_many :attendees
  include BCrypt

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

end
