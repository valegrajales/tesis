class AddForeignKeyToStudents < ActiveRecord::Migration
  def change
    add_column :students, :thesis_id, :integer
    add_index :students, :thesis_id
  end
end
