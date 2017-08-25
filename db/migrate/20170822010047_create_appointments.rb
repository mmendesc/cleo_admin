class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.string :description
      t.integer :employee_id
      t.integer :service_id
      t.integer :client_id

      t.timestamps
    end
  end
end
