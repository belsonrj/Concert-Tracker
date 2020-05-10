class AddColumnTimesSeen < ActiveRecord::Migration
  def change
    add_column :performers, :times_seen, :integer
  end
end
