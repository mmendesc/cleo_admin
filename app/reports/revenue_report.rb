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
    @saloon.revenue_by_day(day)
  end

  def revenue_by_day_and_product(day,name)
    @saloon.revenue_by_day_and_product(day,name)
  end

end
