class Saloon < ApplicationRecord
  has_many :employees
  has_many :managers, class_name: 'Employee', foreign_key: 'manager_id', inverse_of: :saloon

  accepts_nested_attributes_for :managers


  def top_ten
    expenses = []
    Client.by_saloon(self.id).all.each do |client|
      expenses << [client.total_expense,client.id]
    end
    expenses.sort.last(10)
  end

  def total_revenue
    total = 0
    Sale.by_saloon(self.id).all.each do |sale|
      total = total + sale.total_price
    end
    total
  end

  def product_revenue(name)
    product = Product.find_by(name: name)
    total = 0
    Sale.by_saloon(self.id).joins(:items).where('items.product_id = ?',product.id).each do |sale|
      total = total + sale.total_price
    end
    total
  end


  def revenue_by_day(date)
    total = 0
    Sale.by_saloon(self.id).where(created_at: date.beginning_of_day..date.end_of_day).each do |sale|
      total = total + sale.total_price
    end
    total
  end

  def revenue_by_day_and_product(date,name)
    product = Product.find_by(name: name)
    total = 0
    Sale.by_saloon(self.id).joins(:items).where("sales.created_at >= ? AND sales.created_at <= ? and items.product_id = ?", date.beginning_of_day,date.end_of_day,product.id).each do |sale|
      total = total + sale.total_price
    end
    total
  end

end
