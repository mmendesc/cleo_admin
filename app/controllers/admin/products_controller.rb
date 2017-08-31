class Admin::ProductsController < ApplicationController

  before_action :set_product, except: [:index,:new,:create]
  before_action :set_page_name, except: [:create,:update,:destroy]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: 'Produto criado com sucesso'
    else
      redirect_to :back, notice: 'Ocorreu um erro'
    end
  end

  def edit

  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to [:admin,@product]
    else
      redirect_to :back
    end
  end

  def destroy
    if @product.destroy
      redirect_to admin_products_path
    else
      redirect_to admin_products_path
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name,:price,:quantity,:manufacturer_id)
  end

  def set_page_name
    @page = t(params[:action], scope: 'controllers.products')
  end
end
