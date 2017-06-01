class AddUserIdColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :cell_phones, :user_id, :integer
    add_foreign_key :cell_phones, :users
  end
end
