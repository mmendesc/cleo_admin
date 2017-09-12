class Admin::ClientsController < BaseAdminController

  before_action :set_client, except: [:index,:new,:create]
  before_action :set_page_name, except: [:create,:update,:destroy]

  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to admin_clients_path, notice: 'Cliente registrado com sucesso.'
    else
      redirect_to admin_clients_path, notice: 'Ocorreu um erro'
    end
  end

  def show
    @client = Client.find(params[:id])
  end

  def edit

  end

  def update
    @client = Client.find(params[:id])
    if @client.update_attributes(client_params)
      redirect_to [:admin,@client]
    else
      redirect_to :back
    end
  end

  def destroy
    if @client.destroy
      redirect_to admin_clients_path
    else
      redirect_to admin_clients_path
    end
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name,:email,:telephone,:cellphone,:zipcode,:number,:street,:cpf,:birthday,:sex,:district)
  end

  def set_page_name
    @page = t(params[:action], scope: 'controllers.clients')
  end
end
