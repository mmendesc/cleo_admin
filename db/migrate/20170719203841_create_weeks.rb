class CreateWeeks < ActiveRecord::Migration[5.0]
  def change
    create_table :weeks do |t|
      t.integer :sunday
      t.integer :monday
      t.integer :tuesday
      t.integer :wednesday
      t.integer :thurdsay
      t.integer :friday
      t.integer :saturday
      t.integer :contract_id
    end
  end
end
