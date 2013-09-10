# == Schema Information
#
# Table name: meeting_annotations
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  content        :text
#  attachment_url :string(255)
#  meeting_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class MeetingAnnotation < ActiveRecord::Base
  attr_accessible :attachment_url, :content, :title

  # ============
  # Associations
  # ============
  belongs_to :meeting

  # ============
  # Validations
  # ============
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true
end
