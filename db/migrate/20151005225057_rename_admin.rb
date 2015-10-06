class RenameAdmin < ActiveRecord::Migration
  def change
    rename_table :admin, :admins
  end
end
