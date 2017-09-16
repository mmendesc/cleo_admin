class AddSaloonIdToTables < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :saloon_id, :integer
    add_column :clients, :saloon_id, :integer
    add_column :manufacturers, :saloon_id, :integer
    add_column :products, :saloon_id, :integer
    add_column :services, :saloon_id, :integer
  end
end
