class Manufacturer < ApplicationRecord

  has_many :products

  validates_presence_of :name

  scope :by_saloon, ->(saloon) {where(saloon_id: saloon)}
end
