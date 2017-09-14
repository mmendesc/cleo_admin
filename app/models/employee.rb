class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :contract, inverse_of: :employee
  has_many :abilities, inverse_of: :employee
  # belongs_to :saloon

  accepts_nested_attributes_for :contract
  accepts_nested_attributes_for :abilities

  enum role: {worker: 0, secretary: 1}
  enum gender: {male: 0, female: 1}
end
