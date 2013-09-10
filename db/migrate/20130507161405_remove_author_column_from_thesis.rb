class RemoveAuthorColumnFromThesis < ActiveRecord::Migration
  def change
    remove_column :theses, :author
  end
end
