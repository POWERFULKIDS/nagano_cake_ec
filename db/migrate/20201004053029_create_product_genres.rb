class CreateProductGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :product_genres do |t|
      t.string :name, null: false
      t.boolean :genre_status, null: false, default: true
      t.timestamps
    end
  end
end
