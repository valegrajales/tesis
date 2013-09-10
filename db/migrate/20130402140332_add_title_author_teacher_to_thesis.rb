class AddTitleAuthorTeacherToThesis < ActiveRecord::Migration
  def change
    add_column :theses, :title, :string
    add_column :theses, :author, :string
    add_column :theses, :teacher, :string
  end
end
