# == Schema Information
#
# Table name: meetings
#
#  id           :integer          not null, primary key
#  meeting_date :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  thesis_id    :integer
#

class Meeting < ActiveRecord::Base
  attr_accessible :meeting_date

  # ============
  # Associations
  # ============
  has_many :meeting_annotations, dependent: :destroy
  belongs_to :thesis
end
