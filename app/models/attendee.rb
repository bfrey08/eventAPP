require 'bcrypt'

class Attendee < ApplicationRecord
  belongs_to :event
  has_many :chats
  has_many :rooms, through: :chats
  has_many :polls
  has_many :attendee_responses
  has_many :responses, through: :attendee_responses
  validates :phone_number, format: { with: /\(\d{3}\)\s\d{3}-\d{4}/, message: 'phone number format (555) 555-5555'}
  include BCrypt


  def password
    @password ||= Password.new(api_key)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.api_key = @password
  end

  def phone_number_with_prefix
    mod_phone = phone_number.gsub(/[^\d]/, '')
    "+1#{mod_phone}"
  end
end
