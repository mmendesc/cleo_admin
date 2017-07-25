class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :product_id
      t.integer :quantity
      t.decimal :discount
      t.integer :sale_id

      t.timestamps
    end
  end
end
