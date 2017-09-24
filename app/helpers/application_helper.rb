module ApplicationHelper

  def sign_out_path
    if employee_signed_in?
      destroy_employee_session_path
    end
  end
end
