class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, unique: true
      t.string :email
      t.string :password_digest
      t.datetime :last_login

      t.timestamps
    end
  end
end
