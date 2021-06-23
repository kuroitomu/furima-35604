class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :shipping_charges
  belongs_to_active_hash :prefectures
  belongs_to_active_hash :shipping_time

   belongs_to       :user
   has_one          :purchase
   has_one_attached :image
  #  has_one          :order
  #  has_many         :comments

with_options presence: true do
  validates :image
  validates :name
  validates :product_explanation
  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :product_status_id
  validates :shipping_charges_id
  validates :prefectures_id
  validates :shipping_time_id
    end
  end 
end
