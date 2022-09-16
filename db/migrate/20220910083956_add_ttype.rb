class AddTtype < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :truck_type, :string, default: "{}"
  end
end
