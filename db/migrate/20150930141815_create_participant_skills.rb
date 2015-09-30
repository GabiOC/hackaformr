class CreateParticipantSkills < ActiveRecord::Migration
  def change
    create_table :participant_skills do |t|
      t.references :participant, index: true
      t.references :skills, index: true
    end
    add_foreign_key :participant_skills, :participants
    add_foreign_key :participant_skills, :skills
  end
end
