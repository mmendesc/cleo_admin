class SalesController < ApplicationController

  def new
    @sale = Sale.new
  end

  def create
    binding.pry
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to products_path, notice: 'Venda realizada com sucesso.'
    else
      redirect_to :back, notice: 'Ocorreu um erro'
    end
  end

  private

  def sale_params
    params.require(:sale).permit(:employee_id,:client_id, items_attributes: [:id,:product_id,:quantity,:discount,:sale_id])
  end
end
