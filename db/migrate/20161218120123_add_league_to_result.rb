class AddLeagueToResult < ActiveRecord::Migration
  def change
    add_reference :results, :league, index: true, foreign_key: true
  end
end
