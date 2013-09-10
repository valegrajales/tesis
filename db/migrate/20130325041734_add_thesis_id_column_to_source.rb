class AddThesisIdColumnToSource < ActiveRecord::Migration
  def change
    add_column :sources, :title, :string
    add_column :sources, :reference, :string
    add_column :sources, :thesis_id, :integer
  end
end
