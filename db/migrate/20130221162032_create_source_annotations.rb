class CreateSourceAnnotations < ActiveRecord::Migration
  def change
    create_table :source_annotations do |t|
      t.string :title
      t.text :content
      t.integer :source_id

      t.timestamps
    end
  end
end
