class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show

  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if@product.save
      redirect_to products_path, notice: 'Produto criado com sucesso'
    else
      redirect_to :back, notice: 'Ocorreu um erro'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name,:price,:quantity,:manufacturer_id)
  end
end
