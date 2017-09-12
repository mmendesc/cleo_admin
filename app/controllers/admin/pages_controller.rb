class Admin::PagesController < BaseAdminController

  def calendar
    @appointment = Appointment.new
  end

end
