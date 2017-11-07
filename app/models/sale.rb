class Sale < ApplicationRecord
  has_many :items, inverse_of: :sale
  belongs_to :client
  belongs_to :employee
  accepts_nested_attributes_for :items

  scope :by_saloon, ->(saloon) { joins(:employee).where(employees: {saloon_id: saloon})}

  def total_price
    total = 0
    self.items.each do |item|
      total = total + item.total_price
    end
    total
  end

end
