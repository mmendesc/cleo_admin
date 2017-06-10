class ClientsController < ApplicationController

  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to clients_path, notice: 'Cliente registrado com sucesso.'
    else
      redirect_to clients_path, notice: 'Ocorreu um erro'
    end
  end

  private

  def client_params
    params.require(:client).permit(:name,:email,:telephone,:cellphone,:zipcode,:number,:street,:cpf,:birthday,:sex,:district)
  end
end
