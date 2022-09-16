class RmTtype < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :truck_type
  end
end
