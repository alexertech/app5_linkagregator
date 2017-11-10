class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :pass_salt
      t.string :pass_hash
      t.integer :usertype

      t.timestamps
    end
  end
end
