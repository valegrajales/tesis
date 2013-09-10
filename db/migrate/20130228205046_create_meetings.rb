class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.datetime :meeting_date

      t.timestamps
    end
  end
end
