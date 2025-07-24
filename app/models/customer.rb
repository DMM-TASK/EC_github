class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orderaddresses, dependent: :destroy
  has_many :addresses, class_name: 'Orderaddress', foreign_key: 'customer_id' #外部キー追加
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  def full_name
    first_name + " " + last_name
  end

  def full_name_kana
    first_name_kana + " " + last_name_kana
  end

  def active_for_authentication?
    super && is_active?
  end

  def inactive_message
    is_active? ? super : :deactivated_account
  end
  
end
