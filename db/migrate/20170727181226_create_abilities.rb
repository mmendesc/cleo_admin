class CreateAbilities < ActiveRecord::Migration[5.0]
  def change
    create_table :abilities do |t|
      t.integer :employee_id
      t.integer :service_id
      t.decimal :commission

      t.timestamps
    end
  end
end
