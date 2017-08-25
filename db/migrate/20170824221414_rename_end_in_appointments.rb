class RenameEndInAppointments < ActiveRecord::Migration[5.0]
  def change
    rename_column :appointments, :end, :end_date
  end
end
