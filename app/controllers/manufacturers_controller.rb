class ManufacturersController < ApplicationController

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    if @manufacturer.save
      @manufacturers = Manufacturer.all
      respond_to do |format|
        format.js
      end
    end
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name)
  end

end
