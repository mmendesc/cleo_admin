class AddSaloonIdToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :saloon_id, :integer
  end
end
