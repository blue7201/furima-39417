class Item < ApplicationRecord

  belongs_to :user

  with_options presence: true do
    validates :item_name
    validates :description
    validates :category_id
    validates :state_id
    validates :postage_id
    validates :region_id
    validates :shipping_date_id
    validates :price
    validates :image

end
