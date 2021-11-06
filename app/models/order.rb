class Order < ApplicationRecord
  belongs_to :costermer
  has_many :order_detail, dependent: :destroy
end
