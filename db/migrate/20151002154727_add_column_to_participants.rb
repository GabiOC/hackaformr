class AddColumnToParticipants < ActiveRecord::Migration
  def change
    add_reference :participants, :team, index: true
    add_foreign_key :participants, :teams
  end
end
