class Product < ApplicationRecord

  belongs_to :manufacturer

  delegate :name, to: :manufacturer, prefix: true

  validates_presence_of :name,:price,:quantity, :manufacturer_id
  validates :quantity, numericality: { greater_than_or_equal_to: 0}

  scope :by_saloon, ->(saloon) {where(saloon_id: saloon)}


end
