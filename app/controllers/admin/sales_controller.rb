class Admin::SalesController < BaseAdminController
  load_and_authorize_resource
  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    begin
      Sale.transaction do
        @sale.save
        @sale.items.each do |item|
          product = item.product
          product.quantity = product.quantity - item.quantity
          product.save!
        end
      end
      redirect_to admin_products_path, notice: 'Venda realizada com sucesso.'
    rescue => e
      Rails.logger.error "Message: #{e.message}"
      redirect_to :back, alert: 'Ocorreu um erro na venda de um produto'
    end
  end

  private

  def sale_params
    params.require(:sale).permit(:employee_id,:client_id, items_attributes: [:id,:product_id,:quantity,:discount,:sale_id])
  end
end
