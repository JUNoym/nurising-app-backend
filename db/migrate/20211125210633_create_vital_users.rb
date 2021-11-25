class CreateVitalUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :vital_users do |t|
      t.string :name

      t.timestamps
    end
  end
end
