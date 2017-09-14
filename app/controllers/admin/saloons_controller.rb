class Admin::SaloonsController < BaseAdminController

  before_action :set_saloon, except: [:index,:new,:create]
  before_action :set_page_name, except: [:create,:update,:destroy]

  def index
    @saloons = Saloon.all
  end

  def new
    @saloon = Saloon.new
  end

  def create
    #code
  end
end

private

def set_saloon
  @saloon = Saloon.find(params[:id])
end

def saloon_params
  params.require(:saloon).permit(:name,:email,:phone,:cnpj,:zipcode,:street,:complement,:employee_id)
end

def set_page_name
  @page = t(params[:action], scope: 'controllers.saloons')
end
