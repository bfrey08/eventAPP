class AttendeeOtpController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end
  def show
    @attendee = Attendee.find(params[:attendee_id])
    if not @attendee
      redirect_to '/'
    end
  end

  def create
      attendee = Attendee.find_by(phone_number: params[:phone_number])
      if not attendee
        redirect_to '/verify'
      end
      TwilioService.send_otp_message(attendee)
      redirect_to "/verify/#{attendee.id}"
  end

  def complete_otp
    otp_code = params[:otp_code]
    attendee = Attendee.find(params[:attendee_id])
    if TwilioService.verify_otp_code?(otp_code, attendee.phone_number_with_prefix)
      redirect_to "/welcome/#{attendee.id}"
    else
      redirect_to "/verify"
    end
  end
end
