class RemoveReferenceFromUsers < ActiveRecord::Migration
  def change
    remove_reference :users, :team
  end
end
