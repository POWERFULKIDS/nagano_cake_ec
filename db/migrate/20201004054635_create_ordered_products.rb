class CreateOrderedProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_products do |t|
      t.integer :order_id, null: false
      t.integer :product_id, null: false
      t.integer :amount, null: false
      t.integer :price, null: false
      t.integer :make_status, null: false, default: 0
      t.timestamps
    end
  end
end
