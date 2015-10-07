class ChangeColumnTypeInHackathon < ActiveRecord::Migration
  def change
    change_column :hackathons, :start_date, :date
  end
end
