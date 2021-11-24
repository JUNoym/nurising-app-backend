class DeleteTimeColumnInUsers < ActiveRecord::Migration[6.1]
  def up
    remove_column :users,:time,:string
  end
end
