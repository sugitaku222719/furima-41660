class PurchaserHistory
  include ActiveModel::Model
  attr_accessor :history_id, :postal_code, :area_id, :city, :address_line1, :address_line2, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :history_id
    validates :postal_code
    validates :city
    validates :address_line1
    validates :phone_number
    validates :user_id
    validates :item_id
  end
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    history = History.create(user_id:, item_id:)
    Purchaser.create(history_id: history.id, postal_code:, area_id:, city:,
                     address_line1:, address_line2:, phone_number:)
  end
end
