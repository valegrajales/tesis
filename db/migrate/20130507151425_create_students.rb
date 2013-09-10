class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :major
      t.string :student_code
      t.string :username
      t.integer :age

      t.timestamps
    end
  end
end
