class RenameParticipants < ActiveRecord::Migration
  def change
    rename_table :participants, :users
  end
end
