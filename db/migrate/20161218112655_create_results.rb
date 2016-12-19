class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.date :date
      t.integer :home_team_id
      t.integer :home_team_score
      t.integer :away_team_id
      t.integer :away_team_score

      t.timestamps null: false
    end
  end
end
