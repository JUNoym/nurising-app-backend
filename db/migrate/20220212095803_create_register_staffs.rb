class CreateRegisterStaffs < ActiveRecord::Migration[6.1]
  def change
    create_table :register_staffs do |t|
      t.string :name, null: false
      t.boolean :have_work, null: false, default: false
      t.datetime :work_in
      t.datetime :work_out

      t.timestamps
    end
  end
end
