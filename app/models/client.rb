class Client < ApplicationRecord

  validates_presence_of :name,:email

  scope :by_saloon, ->(saloon) {where(saloon_id: saloon)}

  has_many :sales



  def total_expense
    total = 0
    self.sales.each do |sale|
      total = sale.total_price
    end
    total
  end
end
