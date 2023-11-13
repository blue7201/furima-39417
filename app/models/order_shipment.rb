class OrderShipment
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postalcode, :region_id, :city, :block, :building, :phone_number, :token

  with_options presence: true do
    # orderモデルのバリデーション
    validates :user_id
    validates :item_id
    # shipmentモデルのバリデーション
    validates :postalcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :region_id, numericality: { other_than: 1 }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    # トークンのバリデーション
    validates :token
  end

  def save
    # 購入情報を保存し、変数orderに代入する
    order = Order.create(user_id: user_id, item_id: item_id)
     # 住所を保存する
    Shipment.create(postalcode: postalcode, region_id: region_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end