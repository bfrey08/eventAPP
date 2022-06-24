require 'twilio-ruby'

class TwilioService

  def self.create_message(to, body)
    account_sid = Rails.application.credentials.twilio_account_SID
    auth_token = Rails.application.credentials.twilio_auth_token
    from = Rails.application.credentials.twilio_from_number
    client = Twilio::REST::Client.new(account_sid, auth_token)

    client.messages.create(from: from, to: to, body: body)
  end

end
