class AddFokingTruckType < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :truck_type, :text, array: true, default: []
  end
end
