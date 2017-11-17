class Admin::ReportsController < BaseAdminController
  authorize_resource :class => false


  def top_report

  end

  def revenue

  end


  def day_revenue
    @day = params[:day] || Date.today.strftime("%m/%d/%Y")
  end

  def day_product_revenue
    @day = params[:day] || Date.today.strftime("%m/%d/%Y")
    @product = params[:product] ?  Product.find(params[:product]) : Product.new
  end

  def product_revenue
    @product = params[:product] ?  Product.find(params[:product]) : Product.new
  end

  def top_ten
    render json: ClientReport.new(Saloon.first).top_ten
  end

  def total_revenue
    render json: RevenueReport.new(Saloon.first).total_revenue
  end

  def revenue_by_day
    render json: RevenueReport.new(Saloon.first).revenue_by_day(params[:day].to_date)
  end

  def revenue_by_day_and_product
    render json: RevenueReport.new(Saloon.first).revenue_by_day_and_product(params[:day].to_date,params[:product])
  end

  def revenue_by_product
    render json: ProductReport.new(Saloon.first,params[:product]).product_revenue
  end
end
