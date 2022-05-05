class Response < ApplicationRecord
  belongs_to :poll
  has_many :attendee_responses
  has_many :attendees, through: :attendee_responses

end
