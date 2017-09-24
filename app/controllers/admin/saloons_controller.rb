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
    @saloon = Saloon.new(saloon_params)
    if @saloon.save
      set_saloon_id(@saloon.managers.first)
      redirect_to admin_saloons_path, notice: 'Cliente registrado com sucesso.'
    else
      redirect_to admin_saloons_path, notice: 'Ocorreu um erro'
    end
  end
  private

  def set_saloon_id(manager)
    manager.saloon_id = manager.manager_id
    manager.save
  end

  def set_saloon
    @saloon = Saloon.find(params[:id])
  end

  def saloon_params
    params.require(:saloon).permit(:name,:email,:phone,:cnpj,:zipcode,:street,:complement,:employee_id, managers_attributes: [:id,:name,:email,:password,:password_confirmation])
  end

  def set_page_name
    @page = t(params[:action], scope: 'controllers.saloons')
  end
end
