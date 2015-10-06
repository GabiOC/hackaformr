class AddReferenceToHackathons < ActiveRecord::Migration
  def change
    add_reference :hackathons, :admin, index: true
    add_foreign_key :hackathons, :admins
  end
end
