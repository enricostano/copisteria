class UserMailer < ActionMailer::Base
  default from: "copisteria@stanosas.it"

  def order_created_to_admin(order)
    @order = order
    @url = order_path(order)
    mail(:to => 'enricostn@gmail.com', :subject => 'Nuovo ordine ricevuto')
  end

end
