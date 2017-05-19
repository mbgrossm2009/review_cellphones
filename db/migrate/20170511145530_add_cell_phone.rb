class AddCellPhone < ActiveRecord::Migration[5.0]
  def change

    create_table :cell_phones do |t|

      t.string :name, null: false
      t.string :manufacturer, null: false

      t.timestamps
    end
  end
end
