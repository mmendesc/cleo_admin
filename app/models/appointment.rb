# Consultas
class Appointment < ApplicationRecord
  belongs_to :saloon
  belongs_to :client
  belongs_to :employee
  belongs_to :service
  attr_accessor :appointment_time


  scope :by_saloon, -> (saloon) {where(saloon_id: saloon.id)}
end
