class AddColumnUserId < ActiveRecord::Migration
  def change
    add_column :performers, :user_id, :integer
    add_column :venues, :user_id, :integer
  end
end
