class CreateVitalContents < ActiveRecord::Migration[6.1]
  def change
    create_table :vital_contents do |t|
      t.integer :kt
      t.integer :bp
      t.integer :plus
      t.integer :spo2
      t.references :Vital_User, null: false, foreign_key: true

      t.timestamps
    end
  end
end
