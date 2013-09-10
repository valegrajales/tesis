class AddMeetingAnnotationIndex < ActiveRecord::Migration
  def change
    add_index :meeting_annotations, :meeting_id
  end
end
