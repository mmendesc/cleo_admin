class Admin::PagesController < ApplicationController

  def calendar
    @appointment = Appointment.new
  end

end
