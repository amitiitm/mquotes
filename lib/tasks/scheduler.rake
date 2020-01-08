#include Twilio
require 'twilio'
include ActionView::Helpers::NumberHelper
namespace :scheduler do
	desc "This rake will calculate the remaining days and send sms alert using twilio"
	task :send_quote => :environment do
		## defining constants for mobile number on which sms is to be sent
		MOBILE = '+12679692118'

		# Generate random & non repetitive code
		quote = QuoteHandler.generate_uniq_quote

		result = Twilio.send_sms(quote,MOBILE)
		## simply printing the output of sms function it can be success or exception message
		puts result
	end
end