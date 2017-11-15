class Item < ApplicationRecord
  belongs_to :sale
  belongs_to :product

  scope :by_saloon, ->(saloon) { joins(:product).where(products: {saloon_id: saloon})}


  def single_price
    (Product.find(self.product_id).price.to_f * (1 - ( self.discount.to_f/100.0)))
  end

  def total_price
    single_price * self.quantity
  end

end
