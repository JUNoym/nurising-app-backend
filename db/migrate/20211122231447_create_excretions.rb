class CreateExcretions < ActiveRecord::Migration[6.1]
  def change
    create_table :excretions do |t|
      t.string :name

      t.timestamps
    end
  end
end
