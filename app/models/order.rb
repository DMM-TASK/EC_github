class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  

  attr_accessor :select_address, :address_id
  enum payment_method: { credit_card: 0, bank_transfer: 1 }
  enum status: { waiting_payment: 0, paid: 1, making: 2, preparing: 3, shipped: 4 }

  default_scope { order(created_at: :desc)}


  def payment_method_i18n
    I18n.t("activerecord.attributes.order.payment_method.#{payment_method}")
  end

  def status_i18n
    I18n.t("activerecord.attributes.order.status.#{status}")
  end


end