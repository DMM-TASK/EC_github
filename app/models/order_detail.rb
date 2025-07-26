class OrderDetail < ApplicationRecord
  
  belongs_to :order
  belongs_to :item

  enum making_status: { not_make: 0, wait_make: 1, now_make: 2, complete_make: 3 }
end
