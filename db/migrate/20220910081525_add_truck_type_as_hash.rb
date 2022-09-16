class AddTruckTypeAsHash < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :truck_type, :jsonb, default: {}
  end
end
