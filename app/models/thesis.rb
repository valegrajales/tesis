# == Schema Information
#
# Table name: theses
#
#  id          :integer          not null, primary key
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  title       :string(255)
#  author      :string(255)
#  teacher     :string(255)
#

class Thesis < ActiveRecord::Base
  attr_accessible :title, :description, :teacher

  # ============
  # Associations
  # ============
  has_many :sources, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :meetings, dependent: :destroy
  has_many :students

  # ============
  # Validations
  # ============
  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 200 }
  validates :teacher, presence: true
end
