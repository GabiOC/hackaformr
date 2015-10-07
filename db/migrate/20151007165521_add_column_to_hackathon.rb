class AddColumnToHackathon < ActiveRecord::Migration
  def change
    add_column :hackathons, :location, :string
  end
end
