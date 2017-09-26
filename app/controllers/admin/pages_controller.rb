class Admin::PagesController < BaseAdminController
  authorize_resource :class => false
  def calendar
    @appointment = Appointment.new
  end

end
