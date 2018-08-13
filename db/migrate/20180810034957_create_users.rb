class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, unique: true
      t.string :password_hash
      t.datetime :last_login

      t.timestamps
    end
  end
end
