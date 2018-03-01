class OrderMailer < ApplicationMailer
default from: 'no-reply@jungle.com'


    def order_email(order)
        @order = order

        mail(to: @order.email, subject: 'Order #{@order.id}')
        puts "---------------"
        puts "order_email invoked, mail to #{@order.email} with Order #{@order.id}" 
        puts "---------------"
    end
end