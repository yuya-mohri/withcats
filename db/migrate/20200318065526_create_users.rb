class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :postcode
      t.string :address
      t.string :tel
      t.string :password_digest
      t.boolean :admin_flag, default:false

      t.timestamps
    end
  end
end
