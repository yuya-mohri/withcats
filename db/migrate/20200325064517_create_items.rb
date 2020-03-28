class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.integer :stock
      t.text :description
      t.string :image
      t.integer :status, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
