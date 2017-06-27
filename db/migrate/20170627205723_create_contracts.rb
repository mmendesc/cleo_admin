class CreateContracts < ActiveRecord::Migration[5.0]
  def change
    create_table :contracts do |t|
      t.integer :employee_id
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.integer :status
    end
  end
end
