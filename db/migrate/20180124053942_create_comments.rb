class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.string :restaurant_id
      t.string :user_id
      t.timestamps
    end
  end
end
