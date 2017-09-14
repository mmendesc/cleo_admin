class CreateSaloons < ActiveRecord::Migration[5.0]
  def change
    create_table :saloons do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :cnpj
      t.string :zipcode
      t.string :street
      t.string :complement
      t.integer :employee_id

      t.timestamps
    end
  end
end
