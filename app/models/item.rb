class Item < ApplicationRecord
  validates :genre_id, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :is_active, inclusion: { in: [true, false] }


  belongs_to :genre
  has_many :cart_items
  has_many :order_details

  has_one_attached :image
end
