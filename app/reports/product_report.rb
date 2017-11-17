class ProductReport

  def initialize(saloon,product)
    @saloon = saloon
    @product = product
  end

  def product_revenue
    revenue = {}
    revenue['total'] = @saloon.product_revenue(@product)
    revenue['quantity'] = @saloon.product_quantity_sold(@product)
    revenue
  end
end
