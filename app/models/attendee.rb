require 'bcrypt'

class Attendee < ApplicationRecord
  belongs_to :event
  has_many :chats
  has_many :rooms, through: :chats
  has_many :polls
  has_many :attendee_responses
  has_many :responses, through: :attendee_responses
  include BCrypt


  def password
    @password ||= Password.new(api_key)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.api_key = @password
  end

  def phone_number_with_prefix
    phone_number.delete(' ')
    if phone_number[0] != '+'
      "+1#{phone_number}"
    else
      phone_number
    end
  end
end
