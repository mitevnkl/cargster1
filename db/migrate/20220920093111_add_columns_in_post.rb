class AddColumnsInPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :truck_plates, :string
    add_column :posts, :driver_name, :string
    add_column :posts, :driver_contact, :string
    add_column :posts, :terms, :text
  end
end
