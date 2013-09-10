class AddThesisIdColumnToProducts < ActiveRecord::Migration
  def change
    add_column :products, :thesis_id, :integer
  end
end
