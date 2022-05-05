class Poll < ApplicationRecord
  belongs_to :attendee
  has_many :responses

end
