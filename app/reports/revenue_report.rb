class RevenueReport

  def initialize(saloon)
    @saloon = saloon
  end

  def total_revenue
    revenue = {}
    revenue['services'] = @saloon.total_revenue
    revenue['sales'] = @saloon.services_revenue
    revenue['total'] = @saloon.total_revenue + @saloon.services_revenue
    revenue
  end

  def revenue_by_day(day)
    revenue = {}
    revenue['services'] = @saloon.service_by_day(day)
    revenue['sales'] = @saloon.sale_by_day(day)
    revenue['total'] = @saloon.service_by_day(day) + @saloon.sale_by_day(day)
    revenue
  end

  def revenue_by_day_and_product(day,name)
    revenue = {}
    revenue['total'] = @saloon.sale_by_day_and_product(day,name)
    revenue['quantity'] = @saloon.product_quantity_sale(day,name)
    revenue
  end

end
