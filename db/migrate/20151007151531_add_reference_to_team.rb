class AddReferenceToTeam < ActiveRecord::Migration
  def change
    add_reference :teams, :hackathon, index: true
    add_foreign_key :teams, :hackathons
  end
end
