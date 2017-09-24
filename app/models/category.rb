class Category < ApplicationRecord
  has_many :services


  scope :by_saloon, ->(saloon) {where(saloon_id: saloon)}
end
