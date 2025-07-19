class Order < ApplicationRecord
  belongs_to :orders
  has_many :order_details
  attr_accessor :select_address
  enum payment_method: { credit_card: 0, bank_transfer: 1 }
enum status: { waiting_payment: 0, paid: 1, making: 2, preparing: 3, shipped: 4 }
end
