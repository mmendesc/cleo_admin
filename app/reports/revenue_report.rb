class RevenueReport

  def initialize(saloon)
    @saloon = saloon
  end

  def total_revenue
    @saloon.total_revenue
  end

  def revenue_by_day(day)
    @saloon.revenue_by_day(day)
  end

  def revenue_by_day_and_product(day,name)
    @saloon.revenue_by_day_and_product(day,name)
  end

end
