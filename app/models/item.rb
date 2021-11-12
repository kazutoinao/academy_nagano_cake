class Item < ApplicationRecord
  has_many :cart_item, dependent: :destroy
  has_many :order, dependent: :destroy
  belongs_to :order_detail
  attachment :image
end
