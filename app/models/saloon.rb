class Saloon < ApplicationRecord
  has_many :employees
  has_many :managers, class_name: 'Employee', foreign_key: 'manager_id', inverse_of: :saloon
  has_many :products
  accepts_nested_attributes_for :managers


  def top_ten_clients
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

  def services_revenue
    total = 0
    Appointment.by_saloon(self).where("start_date < ?", Time.now + 1.hour).each do |appointment|
      total = total + appointment.service.price.to_f
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


  def sale_by_day(date)
    total = 0
    Sale.by_saloon(self.id).where(created_at: date.beginning_of_day..date.end_of_day).each do |sale|
      total = total + sale.total_price
    end
    total
  end

  def service_by_day(date)
    total = 0
    Appointment.by_saloon(self).where(start_date: date.at_beginning_of_day..date.at_end_of_day).each do |appointment|
      total = total + appointment.service.price.to_f
    end
    total
  end

  def sale_by_day_and_product(date,name)
    product = Product.find_by(name: name)
    total = 0
    Sale.by_saloon(self.id).joins(:items).where("sales.created_at >= ? AND sales.created_at <= ? and items.product_id = ?", date.beginning_of_day,date.end_of_day,product.id).each do |sale|
      total = total + sale.total_price
    end
    total
  end

  def product_quantity_sale(date,product)
    product = Product.find_by(name: product)
    Item.by_saloon(self).where(created_at: date.at_beginning_of_day..date.at_end_of_day).where(product_id: product.id).sum(:quantity)
  end

end
