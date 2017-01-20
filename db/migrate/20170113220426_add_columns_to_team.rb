class AddColumnsToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :fanfactor, :integer
    add_column :teams, :assistantcoaches, :integer
    add_column :teams, :cheerleaders, :integer
    add_column :teams, :apothecary, :boolean
    add_column :teams, :wizard, :boolean
    add_column :teams, :treasury, :integer
  end
end
