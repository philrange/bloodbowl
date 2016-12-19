class AddRerollsToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :rerolls, :integer
  end
end
