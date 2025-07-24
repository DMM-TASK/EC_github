class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details


  attr_accessor :select_address, :address_id
  enum payment_method: { credit_card: 0, bank_transfer: 1 }
  enum status: { waiting_payment: 0, paid: 1, making: 2, preparing: 3, shipped: 4 }

end