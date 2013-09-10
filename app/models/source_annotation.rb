# == Schema Information
#
# Table name: source_annotations
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  source_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SourceAnnotation < ActiveRecord::Base
  attr_accessible :title, :content

  # ============
  # Associations
  # ============
  belongs_to :source

  # ============
  # Validations
  # ============
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true
end
