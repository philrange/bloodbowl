class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
