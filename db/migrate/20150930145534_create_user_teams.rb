class CreateUserTeams < ActiveRecord::Migration
  def change
    create_table :user_teams do |t|
      t.references :user, index: true
      t.references :team, index: true
    end
    add_foreign_key :user_teams, :users
    add_foreign_key :user_teams, :teams
  end
end
