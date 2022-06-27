require 'twilio-ruby'

class TwilioService

  def self.create_message(attendees)
    account_sid = Rails.application.credentials.twilio_account_SID
    auth_token = Rails.application.credentials.twilio_auth_token
    from = Rails.application.credentials.twilio_from_number
    client = Twilio::REST::Client.new(account_sid, auth_token)
    attendees.each do |attendee|
      body = "you are invited to '#{attendee.event.name}' by #{attendee.event.attendees.first.name}, join us: #{Rails.application.credentials.base_url}/events/#{attendee.event.id}/attendees/#{attendee.id}/login/#{attendee.api_key}"
      client.messages.create(from: from, to: attendee.phone_number, body: body)
    end
  end
end
