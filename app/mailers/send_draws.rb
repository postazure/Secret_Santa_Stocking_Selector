class SendDraws < ActionMailer::Base
  default from: current_user.email

  def send_draws_email(giver, reciever)
    @giver = giver
    @reciever = reciever
    mail( :to => @giver.email,
    :subject => "Your Secret Santa Draw is: #{@reciever.name}" )
  end
end
