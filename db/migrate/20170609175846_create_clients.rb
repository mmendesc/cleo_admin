class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :telephone
      t.string :cellphone
      t.string :zipcode
      t.integer :number
      t.string :street
      t.string :cpf
      t.date :birthday
      t.integer :sex
      t.string :district

      t.timestamps
    end
  end
end
