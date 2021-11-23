class Admin::HomesController < ApplicationController
    def top
        @cart_items=Cart_item.all
    end

    private
    def cart_item_params
        params.require(:cart_item).permit(:created_at)
    end
end
