class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.integer :employee_id
      t.integer :service_id
      t.decimal :commission

      t.timestamps
    end
  end
end
