class Sale < ApplicationRecord
  has_many :items, inverse_of: :sale

  accepts_nested_attributes_for :items
end
