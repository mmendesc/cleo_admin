class Ability
  include CanCan::Ability

  def initialize(employee)
    employee ||= Employee.new

    if employee.role == 'master'
      agent_master
    elsif employee.role == 'manager'
      agent_manager
    else
      agent_worker
    end
  end

  protected

  def agent_master
    can :manage, Saloon
    can :manage, Employee
  end

  def agent_manager
    can :manage, Client
    can :manage, Employee
    can :manage, Category
    can :manage, Product
    can :manage, Service
    can :manage, Sale
    can :manage, :page
  end

  def agent_worker
    can :manage, Product
    can :manage, Service
    can :manage, Sale
    can :manage, :page
  end
end
