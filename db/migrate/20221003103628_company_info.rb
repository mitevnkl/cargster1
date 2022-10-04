class CompanyInfo < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :company_address, :text
  end
end
