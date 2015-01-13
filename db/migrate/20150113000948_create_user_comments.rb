class CreateUserComments < ActiveRecord::Migration
  def change
    create_table :user_comments do |t|
      t.string :content, null: false
      t.integer :user_id, null: false
      t.integer :author_id, null: false

      t.timestamps null: false
    end
  end
end
