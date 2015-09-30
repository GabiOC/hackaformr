class AddReferenceToParticipants < ActiveRecord::Migration
  def change
    add_reference :participants, :hackathon, index: true
    add_foreign_key :participants, :hackathons
  end
end
