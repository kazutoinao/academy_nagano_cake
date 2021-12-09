class Public::OrdersController < ApplicationController
    def  new
      @order=Order.new
    end

    def  confirm
       @order=Order.new#（params）
      if  params[:order][:select_address] == "0"
        @order.postal_code = current_customer.postal_code
        @order.name = current_customer.last_name + current_customer.first_name
        @order.address = current_customer.address

      elsif  params[:order][:select_address] == "1"


      elsif  params[:order][:select_address] == "2"

      end


    end

    def  complete
    end

    def  create

    end

    def  index
    end

    def  show
    end
end
