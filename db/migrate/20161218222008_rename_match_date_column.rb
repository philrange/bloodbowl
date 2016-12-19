class RenameMatchDateColumn < ActiveRecord::Migration
  def change
  	 rename_column :results, :date, :match_date
  end
end
