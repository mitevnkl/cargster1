class RemoveColumnsFromPost < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :load_country
    remove_column :posts, :unload_country
  end
end
