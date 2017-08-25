class RenameStartInAppointments < ActiveRecord::Migration[5.0]
  def change
    rename_column :appointments, :start, :start_date
  end
end
