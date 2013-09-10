# == Schema Information
#
# Table name: sources
#
#  id             :integer          not null, primary key
#  description    :string(255)
#  source_type_id :integer
#  attachment_url :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  title          :string(255)
#  reference      :string(255)
#  thesis_id      :integer
#

class Source < ActiveRecord::Base
  attr_accessible :attachment_url, :description, :source_type_id, :title, :reference

  # ============
  # Associations
  # ============
  belongs_to :thesis
  has_many :source_annotations, dependent: :destroy

  # ============
  # Scopes
  # ============
  scope :scoped_find_all_by_thesis_id, lambda { |thesis_id| { conditions: ['thesis_id = ?', thesis_id] } }

  # ============
  # Validations
  # ============
  validates :description, presence: true, length: { maximum: 100 }
  validates :source_type_id, presence: true
  validates :title, presence: true
  validates :reference, presence: true
end
