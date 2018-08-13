class CreateDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :decks do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.integer :cards_due
      t.date :last_seen

      t.timestamps
    end
  end
end
