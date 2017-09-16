class Service < ApplicationRecord
  belongs_to :category

  delegate :name, to: :category, prefix: true

  scope :by_saloon, ->(saloon) {where(saloon_id: saloon)}
end
