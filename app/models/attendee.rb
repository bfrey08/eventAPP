class Attendee < ApplicationRecord
  belongs_to :event
  has_many :chats
  has_many :rooms, through: :chats
  has_many :polls
  has_many :attendee_responses
  has_many :responses, through: :attendee_responses

end
