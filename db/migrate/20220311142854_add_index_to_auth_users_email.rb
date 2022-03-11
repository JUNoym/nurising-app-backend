class AddIndexToAuthUsersEmail < ActiveRecord::Migration[6.1]
  def change
    add_index :auth_users, :email, unique: true
  end
end
