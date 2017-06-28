class CreateIntervals < ActiveRecord::Migration[5.0]
  def change
    create_table :intervals do |t|
      t.time :start_time
      t.time :end_time
      t.integer :contract_id
    end
  end
end
