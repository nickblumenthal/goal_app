class ChangeSessionNameInUser < ActiveRecord::Migration
  def change
    remove_column :users, :session_id
    add_column :users, :session_token, :string
  end
end
