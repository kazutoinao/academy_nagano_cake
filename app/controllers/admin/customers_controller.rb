class Admin::CustomersController < ApplicationController
    def  index
        @customers=Customer.all
    end
    def  show
        @custermer=Custermer.find(params[:id])
    end
    def  edit

    end
    def update
    end
end
