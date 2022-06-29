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

  def self.send_otp_message(attendee)
    account_sid = Rails.application.credentials.twilio_account_SID
    auth_token = Rails.application.credentials.twilio_auth_token
    service_sid = Rails.application.credentials.twilio_service_SID
    app_name = Rails.application.credentials.app_name
    from = Rails.application.credentials.twilio_from_number
    client = Twilio::REST::Client.new(account_sid, auth_token)
    verification_service = client.verify.services(service_sid)

    verification_service.verifications.create(to: attendee.phone_number, channel: 'sms')
  end

  def self.verify_otp_code?(otp_code, phone_number)
    account_sid = Rails.application.credentials.twilio_account_SID
    auth_token = Rails.application.credentials.twilio_auth_token
    service_sid = Rails.application.credentials.twilio_service_SID
    client = Twilio::REST::Client.new(account_sid, auth_token)
    verification_service = client.verify.services(service_sid)
    verification_check = verification_service.verification_checks.create(to: phone_number, code: otp_code)
    verification_check.status == "approved"
  end
end
