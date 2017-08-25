class EmployeesController < ApplicationController

  before_action :set_employee, except: [:index,:new,:create]
  before_action :set_page_name, except: [:create,:update,:destroy]

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employees_path, notice: 'Cliente registrado com sucesso.'
    else
      redirect_to employees_path, notice: 'Ocorreu um erro'
    end
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def edit

  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update_attributes(employee_params)
      redirect_to @employee
    else
      redirect_to :back
    end
  end

  def destroy
    if @employee.destroy
      redirect_to employees_path
    else
      redirect_to employees_path
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:name,:email,:telephone,:cellphone,:zipcode,:number,:street,:cpf,:birthdate,
      :identity,:password,:password_confirmation,:gender,:work_paper,:role, contract_attributes: [:id,:start_date,:end_date,:start_time,:end_time,:employee_id,
        intervals_attributes: [:id,:start_time,:end_time,:contract_id], week_attributes: [:id,:sunday,:monday,:tuesday,:wednesday,:thurdsay,:friday,:saturday,:contract_id]],
        abilities_attributes: [:id,:employee_id,:service_id,:commission])
  end

  def set_page_name
    @page = t(params[:action], scope: 'controllers.employees')
  end

end
