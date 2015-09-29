class CreateUserHackathons < ActiveRecord::Migration
  def change
    create_table :user_hackathons do |t|
      t.references :user, index: true
      t.references :hackathon, index: true
    end
    add_foreign_key :user_hackathons, :users
    add_foreign_key :user_hackathons, :hackathons
  end
end
