class NewOrderEmail < ApplicationMailer
  default from: "no-reply@jungle.com"

  def notify_user(order)
    @order = order
    mail(to: @order.email, subject: "Your Order Reciept")
  end
end
