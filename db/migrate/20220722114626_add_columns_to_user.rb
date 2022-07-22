class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :company_name, :string
    add_column :users, :coc, :string
    add_column :users, :vat, :string
    add_column :users, :viber, :boolean
    add_column :users, :whatsapp, :boolean
    add_column :users, :mobile_nr, :string
  end
end
