class SendDraws < ActionMailer::Base
  default from: @email_from

  def send_draws_email(giver, reciever)
    @giver = giver
    @reciever = reciever
    mail( :to => @giver.email,
    :subject => "Your Secret Santa Draw is: #{@reciever.name}" )
  end
end
