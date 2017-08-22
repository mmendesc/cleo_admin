class Sale < ApplicationRecord
  has_many :items, inverse_of: :sale
  belongs_to :client
  belongs_to :employee
  accepts_nested_attributes_for :items


  def total_price
    total = 0
    self.items.each do |item|
      total = total + item.total_price
    end
    total
  end


  def self.top_ten
    expenses = []
    Client.all.each do |client|
      expenses << [client.total_expense,client.id]
    end
    expenses.sort.last(10)
  end

  def self.total_revenue
    total = 0
    Sale.all.each do |sale|
      total = total + sale.total_price
    end
    total
  end

  def self.product_revenue(name)
    product = Product.find_by(name: name)
    total = 0
    Sale.joins(:items).where('items.product_id = ?',product.id).each do |sale|
      total = total + sale.total_price
    end
    total
  end

  def self.revenue_by_day(date)
    total = 0
    Sale.where(created_at: date.beginning_of_day..date.end_of_day).each do |sale|
      total = total + sale.total_price
    end
    total
  end

  def self.revenue_by_day_and_product(date,name)
    product = Product.find_by(name: name)
    total = 0
    Sale.joins(:items).where("sales.created_at >= ? AND sales.created_at <= ? and items.product_id = ?", date.beginning_of_day,date.end_of_day,product.id).each do |sale|
      total = total + sale.total_price
    end
    total
  end

end
