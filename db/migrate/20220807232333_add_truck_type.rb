class AddTruckType < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :truck_type, :string
  end
end
