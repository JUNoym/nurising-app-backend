class CreateVitalUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :vital_users do |t|
      t.string :name
      t.string :kt
      t.string :bp
      t.string :plus
      t.string :spo2

      t.timestamps
    end
  end
end
