class Contract < ApplicationRecord
  belongs_to :employee
  has_many :intervals, inverse_of: :contract

  accepts_nested_attributes_for :intervals
end
