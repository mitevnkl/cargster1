class RmFokijgTtype < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :truck_type, :text, default: [].to_yaml
  end
end
