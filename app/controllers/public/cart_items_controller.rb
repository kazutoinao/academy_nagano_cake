class Public::CartItemsController < ApplicationController
    def  index
        @cart_items=current_customer.cart_items
        @total=0
        @cart_items.each do |cart_item|
            @total=@total+cart_item.total_price
        end
    end

    def  update

    end

    def  destroy
      @cart_item=CartItem.find(params[:id])
      redirect_to cart_items_path
    end

    def  destroy_all
      @cart_items=current_customer.cart_items
      @cart_items.destroy_all
      redirect_to cart_items_path
    end

    def  create
        @cart_item=CartItem.new(cart_item_params)
        if  @cart_item.save
            redirect_to cart_items_path
        else
            render :index
        end
    end
    private
    def cart_item_params
        params.require(:cart_item).permit(:amount, :item_id, :customer_id)
    end
end
