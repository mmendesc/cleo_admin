class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :contract, inverse_of: :employee
  has_many :abilities, inverse_of: :employee
  belongs_to :saloon, optional: true
  #belongs_to :responsible, class_name: 'Saloon' ,foreign_key: 'manager_id'

  delegate :name, to: :saloon, prefix: :true, allow_nil: true

  accepts_nested_attributes_for :contract
  accepts_nested_attributes_for :abilities

  enum role: {worker: 0, manager: 1,master: 2}
  enum gender: {male: 0, female: 1}

  scope :by_saloon, ->(saloon) {where(saloon_id: saloon)}
  scope :not_master, -> {where.not(role: 3)}

  validate :saloon_presence

  def saloon_presence
    errors.add(:saloon_id, 'Salão é necessário.') if need_saloon
  end

  def need_saloon
    self.role != 'master' && self.saloon_id.nil?
  end
end
