class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.role == 'master'
      admin_saloons_path
    else
      admin_calendar_path
    end
  end

  def after_sign_out_path_for(resource)
    new_employee_session_path
  end

end
