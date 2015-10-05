class RemoveColumnFromParticipant < ActiveRecord::Migration
  def change
    remove_column :participants, :email
  end
end
