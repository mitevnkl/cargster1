class RenameCountry < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :load_country, :load_c
    rename_column :posts, :unload_country, :unload_c
  end
end
