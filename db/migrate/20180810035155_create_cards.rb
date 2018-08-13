class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.text :front
      t.text :back
      t.boolean :due
      t.references :deck, foreign_key: true

      t.timestamps
    end
  end
end
