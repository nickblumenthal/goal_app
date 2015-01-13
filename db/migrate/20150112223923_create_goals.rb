class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :content, null: false
      t.string :visibility, null: false
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
