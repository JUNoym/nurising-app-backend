class CreateCareActions < ActiveRecord::Migration[6.1]
  def change
    create_table :care_actions do |t|
      t.string  :name,:string
      t.timestamps
    end
  end
end
