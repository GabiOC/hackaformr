class RemoveColumnsFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :hackathon_id, :team_id
  end
end
