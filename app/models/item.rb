class Item < ApplicationRecord
  extend ActiveHash:Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :postage
  belongs_to :region
  belongs_to :shipping_date
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :contents
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :postage_id
    validates :region_id
    validates :shipping_date_id
  end
end
