class Issue < ActiveRecord::Base
  belongs_to :user


  	def self.send_text_message(current_user)
  		@current_user = current_user
      number_to_send_to = "+91#{@current_user.phone_number}"
      twilio_sid = "ACfb965aa5afab6d586529c4d7bdc64533"
      twilio_token = "76587f8e40d9a6efccf700ece69a8e79"

      # twilio_phone_number = "15677034351"
      twilio_phone_number = "(331) 209-6104"
      @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
      # raise @twilio_client.inspect
      @twilio_client.account.sms.messages.create(
        from: "#{twilio_phone_number}",
        to: number_to_send_to,
        body: "Easy2Repair: Your Request is in Process"
        )
  end
	

end
