class Client < ApplicationRecord

  validates_presence_of :name,:email

  scope :by_saloon, ->(saloon) {where(saloon_id: saloon)}

end
