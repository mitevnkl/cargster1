class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :status
      t.datetime :load_date
      t.datetime :unload_date
      t.decimal :length
      t.decimal :weight
      t.string :load_country
      t.string :unload_country
      t.string :load_address
      t.string :unload_address
      t.text :description
      t.string :truck_type
      t.boolean :adr
      t.decimal :price
      t.boolean :load
      t.boolean :truck

      t.timestamps
    end
  end
end
