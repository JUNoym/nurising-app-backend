class CreateVitalContents < ActiveRecord::Migration[6.1]
  def change
    create_table :vital_contents do |t|
      t.string :kt
      t.string :bp
      t.string :plus
      t.string :spo2
      t.string :name
      t.references :Vital_User, foreign_key: true

      t.timestamps
    end
  end
end
