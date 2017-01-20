class AddFinalisedToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :finalised, :boolean
  end
end
