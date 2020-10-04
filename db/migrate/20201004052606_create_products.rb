class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :product_genre_id, null: false
      t.string :name, null: false
      t.string :image_id, null: false
      t.text :body, null: false
      t.integer :price, null: false
      t.boolean :sale_status, null: false, default: true

      t.timestamps
    end
  end
end
