require 'bcrypt'
class Event < ApplicationRecord
  has_many :attendees
  has_many :rooms, through: :attendees
  include BCrypt

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  def quick_details
    location1 = " @ #{location}" if location
    start1 = " on #{start}" if start
    "#{name + location1 or '' + start1 or ''}"
  end
end
