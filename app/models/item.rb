class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :postage
  belongs_to :region
  belongs_to :shipping_date

  belongs_to :user
  has_one_attached :image
  has_one :order

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }

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

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :postage_id
    validates :region_id
    validates :shipping_date_id
  end
end
