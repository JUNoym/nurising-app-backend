class AddPasswordDigestToAuthUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :auth_users, :password_digest, :string
  end
end
