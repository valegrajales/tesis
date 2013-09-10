class AddIndexToProducts < ActiveRecord::Migration
  def change
    add_index :products, :thesis_id
  end
end
