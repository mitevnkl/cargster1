class AddColumnsToPostAsArray < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :load_country, :string, array: true, default: []
    add_column :posts, :unload_country, :string, array: true, default: []
  end
end
