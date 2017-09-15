class Saloon < ApplicationRecord
  has_many :employees
  has_one :manager, class_name: 'Employee', foreign_key: 'manager_id'
end
