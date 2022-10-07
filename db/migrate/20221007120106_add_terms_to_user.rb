class AddTermsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :terms, :boolean, default: false
  end
end
