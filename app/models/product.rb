class Product < ApplicationRecord

  belongs_to :manufacturer

  delegate :name, to: :manufacturer, prefix: true

  validates_presence_of :name,:price,:quantity, :manufacturer_id

  scope :by_saloon, ->(saloon) {where(saloon_id: saloon)}
end
