class RmDefaultOnCountries < ActiveRecord::Migration[6.1]
  def change
    change_column_default :posts, :load_country, nil
    change_column_default :posts, :unload_country, nil
  end
end
