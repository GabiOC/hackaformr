class RemoveColumnFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :skills
  end
end
