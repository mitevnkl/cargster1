class ChangeTrType < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :truck_type, :string
  end
end
