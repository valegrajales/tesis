class CreateMeetingAnnotations < ActiveRecord::Migration
  def change
    create_table :meeting_annotations do |t|
      t.string :title
      t.text :content
      t.string :attachment_url
      t.integer :meeting_id

      t.timestamps
    end
  end
end
