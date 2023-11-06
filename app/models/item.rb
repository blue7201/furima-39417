class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :postage
  belongs_to :region
  belongs_to :shipping_date

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :item_name
    validates :description
    validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :state_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :postage_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :region_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :shipping_date_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :price
    validates :image
  end
end
