class CartItem < ApplicationRecord
    belongs_to :costermer
    belongs_to :item
end
