class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :cards_count
      t.integer :reviews_count, default: 0
      t.references :deck, foreign_key: true

      t.timestamps
    end
  end
end
