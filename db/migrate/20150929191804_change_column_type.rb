class ChangeColumnType < ActiveRecord::Migration
  def change
    change_column :hackathons, :start_date, :string
  end
end
