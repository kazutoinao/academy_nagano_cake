class Public::OrdersController < ApplicationController
    def  new
      @customer=current_customer
      @order=Order.new
      @address=Address.all
    end

    def  confirm
      @cart_items=current_customer.cart_items
      @total=0
        @cart_items.each do |cart_item|
            @total=@total+cart_item.total_price
        end
      @order=Order.new(order_params)
      if  params[:order][:address_select] == "0"
        @order.postal_code = current_customer.postal_code
        @order.name = current_customer.last_name + current_customer.first_name
        @order.address = current_customer.address

      elsif  params[:order][:address_select] == "1"
        @address = Address.find(params[:order][:address_id])
        @order.postal_code = @address.postal_code
        @order.address = @address.address
        @order.name = @address.name

      elsif  params[:order][:address_select] == "2"
        @order.postal_code = params[:order][:postal_code]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
      end
      if params[:order][:payment_method] =="credit_card"
        @order.payment_method=0
      elsif  params[:order][:payment_method] =="transfer"
        @order.payment_method=1
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

    private
    def order_params
        params.require(:order).permit(:payment_method, :address, :name, :postal_code)
    end
end
