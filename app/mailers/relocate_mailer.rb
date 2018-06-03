class RelocateMailer < ApplicationMailer
	def test_email
		@message = "Test email"
    mail(to: 'aviyasharabi1@gmail.com', subject: 'Welcome to My Relocate Site')
  	end
end
