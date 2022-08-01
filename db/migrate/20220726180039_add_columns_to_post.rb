class AddColumnsToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :load_city, :string
    add_column :posts, :unload_city, :string
  end
end
