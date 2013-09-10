class SourceAnnotationsSourceIdIndex < ActiveRecord::Migration
  def change
    add_index :source_annotations, :source_id
  end
end
