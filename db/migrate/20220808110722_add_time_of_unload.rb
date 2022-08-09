class AddTimeOfUnload < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :load_time, :time
    add_column :posts, :unload_time, :time
  end
end
