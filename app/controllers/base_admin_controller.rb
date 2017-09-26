class BaseAdminController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'admin'

  rescue_from CanCan::AccessDenied do |exception|
    flash.now[:danger] = "Acesso negado. Você não está autorizado a acessar essa página"
    if current_employee.role == 'master'
      redirect_to admin_saloons_path,alert: "Acesso negado. Você não está autorizado a acessar essa página"
    else
      redirect_to admin_calendar_path,alert: "Acesso negado. Você não está autorizado a acessar essa página"
    end

  end

  def current_ability
    @current_ability ||= Ability.new(current_employee)
  end

end
