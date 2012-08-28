# encoding: utf-8

class UserMailer < ActionMailer::Base
  default from: "copisteria@stanosas.it"

  def order_created_to_admin(order)
    @order = order
    mail(:to => 'enricostn@gmail.com', :subject => 'Nuovo ordine ricevuto')
  end

  def authorized_order_to_user(order)
    @order = order
    mail(:to => @order.user.email, :subject => 'Il suo ordine è stato autorizzato')
  end
end
