class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path
    employees_path
  end


  private

  def sign_up_params
    params.require(:employee).permit(:name,:email,:telephone,:cellphone,:zipcode,:number,:street,:cpf,:birthdate,
      :identity,:password,:password_confirmation,:gender,:work_paper,:role)
  end
end
