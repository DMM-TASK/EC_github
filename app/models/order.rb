class Order < ApplicationRecord
  belongs_to :orders
  has_many :order_details
end
