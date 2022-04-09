class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      t.integer :user_id
      t.string :name
      t.string :message

      t.timestamps
    end
  end
end
