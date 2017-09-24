class Admin::ManufacturersController < BaseAdminController

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    if @manufacturer.save
      @manufacturers = Manufacturer.by_saloon(current_employee.saloon_id)
      respond_to do |format|
        format.js
      end
    end
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name,:saloon_id)
  end

end
