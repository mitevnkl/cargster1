class ChangeDataTypeOfCountries < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :load_country, :text, array: true, default: []
    change_column :posts, :unload_country, :text, array: true, default: []
  end
end
