class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :race
      t.references :league, index: true, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
