class AddTyype < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :truck_type, :json, default: {}, null: false
  end
end
