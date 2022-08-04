class DeleteStatusFromPost < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :truck
    remove_column :posts, :load
    change_column :posts, :load_country, :string
    change_column :posts, :unload_country, :string
  end
end
