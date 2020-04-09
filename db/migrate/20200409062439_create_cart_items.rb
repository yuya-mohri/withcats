class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :quantity
      t.boolean :ordered_flag, default: false

      t.timestamps
    end
  end
end
