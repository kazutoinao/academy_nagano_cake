class Order < ApplicationRecord
  belongs_to :costermer
  has_many :order_details, dependent: :destroy
end
