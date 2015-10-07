class AddColumnsToHackathon < ActiveRecord::Migration
  def change
    add_column :hackathons, :max_team_size, :integer
    add_column :hackathons, :end_date, :date
    add_column :hackathons, :description, :text
  end
end
