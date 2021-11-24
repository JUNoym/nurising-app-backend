class CreateUserCareActions < ActiveRecord::Migration[6.1]
  def change
    create_table :user_care_actions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :care_action, null: false, foreign_key: true
      t.timestamps
    end
  end
end
