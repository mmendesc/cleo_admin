class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    case resource
    when Employee
      admin_calendar_path
    end
  end

end
