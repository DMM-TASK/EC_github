class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details
  
  enum payment_method: { "クレジットカード": 0, "銀行": 1}
  enum status: { "入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4 }

  belongs_to :orders
  has_many :order_details
  attr_accessor :select_address
  enum payment_method: { credit_card: 0, bank_transfer: 1 }
  enum status: { waiting_payment: 0, paid: 1, making: 2, preparing: 3, shipped: 4 }

