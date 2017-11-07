class Admin::ReportsController < BaseAdminController
  authorize_resource :class => false
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

  def product_revenue
    render json: ProductReport.new(Saloon.first,params[:product]).product_revenue
  end
end
