class AddIndexUsernameToStudents < ActiveRecord::Migration
  def change
    add_index :students, :username, unique: true
  end
end
