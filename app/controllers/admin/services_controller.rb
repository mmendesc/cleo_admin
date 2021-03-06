class Admin::ServicesController < BaseAdminController
  load_and_authorize_resource
  before_action :set_service, except: [:index,:new,:create]
  before_action :set_page_name, except: [:create,:update,:destroy]

  def index
    @services = Service.by_saloon(current_employee.saloon_id)
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to admin_services_path, notice: 'Serviço criado com sucesso'
    else
      redirect_to :back, notice: 'Ocorreu um erro'
    end
  end

  def edit

  end

  def update
    @service = Service.find(params[:id])
    if @service.update_attributes(service_params)
      redirect_to admin_services_path
    else
      redirect_to :back
    end
  end

  def destroy
    if @service.destroy
      redirect_to admin_services_path
    else
      redirect_to admin_services_path
    end
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name,:price,:hours,:minutes,:category_id,:saloon_id)
  end

  def set_page_name
    @page = t(params[:action], scope: 'controllers.services')
  end


end
