class Saloon < ApplicationRecord
  has_many :employees
  has_many :managers, class_name: 'Employee', foreign_key: 'manager_id', inverse_of: :saloon

  accepts_nested_attributes_for :managers
end
