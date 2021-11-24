class RenameExcretionsToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_table :excretions, :users
  end
end
