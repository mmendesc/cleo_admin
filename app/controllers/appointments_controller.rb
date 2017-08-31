class AppointmentsController < ApplicationController

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.start_date = Date.strptime(appointment_params[:start_date], '%m/%d/%Y')
    if appointment_params[:start_date]
      @appointment.start_date = @appointment.start_date + appointment_params[:appointment_time].split(':')[0].to_i.hours
      @appointment.start_date = @appointment.start_date + appointment_params[:appointment_time].split(':')[1].to_i.minutes
      @time_params = @appointment.start_date.to_a[1..5]
    end
    appointment_params[:appointment_time]
    if @appointment.save
      respond_to do |format|
        format.js
      end
    else

    end
  end


  def index
    #binding.pry
    @appointments = []
    Appointment.where('created_at >= ? and created_at <= ?',params[:start],params[:end]).all.each do |appointment|
      @appointments << {
        id: appointment.id,
        title: appointment.title,
        start:  appointment.start_date,
        allDay: false,
        editable: true,
        backgroundColor: '#SomeColor2',
        borderColor: '#SomeColor2',
        eventColor: '#378006'
      }
    end
    render json: @appointments
  end

  def destroy
    @appointment = Appointment.find(params[:id])

    if @appointment.destroy
      redirect_to calendar_path
    else
      redirect_to calendar_path
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(
      :title,
      :start_date,
      :end_date,
      :description,
      :client_id,
      :service_id,
      :employee_id,
      :appointment_time
    )
  end
end
