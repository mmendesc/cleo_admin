class ProductReport

  def initialize(saloon,product)
    @saloon = saloon
    @product = product
  end

  def product_revenue
    @saloon.product_revenue(@product)
  end
end
