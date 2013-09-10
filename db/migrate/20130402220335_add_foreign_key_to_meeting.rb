class AddForeignKeyToMeeting < ActiveRecord::Migration
  def change
    add_column :meetings, :thesis_id, :integer
    add_index :meetings, :thesis_id
  end
end
