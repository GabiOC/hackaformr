class DropUserTeams < ActiveRecord::Migration
  def change
    drop_table :user_teams
  end
end
