class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.integer :cost
      t.integer :MA
      t.integer :ST
      t.integer :AG
      t.integer :AV
      t.integer :quantity
      t.text :skills
      t.text :normal
      t.text :double
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
