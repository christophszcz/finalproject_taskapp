class UserMailer < ApplicationMailer
# default from: 'myemail@gmail.com'


  def exchange_information(assignment)
    @assignment = assignment
    mail(to: @assignment.customer.email, cc: @assignment.worker.email, subject: "Information exchange")
    
  end
end



# def send_email(user)
#   @user = user
#   @url  = 'http://example.com/login'
#   mail(to: @user.email, subject: 'You receive this email because you click on the btn')
#  end
# end




