class AddIndexToSources < ActiveRecord::Migration
  def change
    add_index :sources, :thesis_id
  end
end
