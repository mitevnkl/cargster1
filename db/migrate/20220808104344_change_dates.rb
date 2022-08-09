class ChangeDates < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :load_date, :date
    change_column :posts, :unload_date, :date
  end
end
