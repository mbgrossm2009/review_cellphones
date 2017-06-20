class CreateDownvote < ActiveRecord::Migration[5.0]
  def change
    create_table :downvotes do |t|
        t.integer :cell_phone_id
        t.integer :user_id

        t.timestamps
    end
  end
end
