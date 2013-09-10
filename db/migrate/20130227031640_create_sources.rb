class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.integer :id
      t.string :description
      t.integer :source_type_id
      t.string :attachment_url
      t.timestamps
    end
  end
end
