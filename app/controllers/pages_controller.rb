class PagesController < ApplicationController

  def calendar
    @appointment = Appointment.new
  end

end
