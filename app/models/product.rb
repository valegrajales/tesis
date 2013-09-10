# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  thesis_id   :integer
#

class Product < ActiveRecord::Base
  attr_accessible :description

  # ============
  # Associations
  # ============
  belongs_to :thesis

  # ============
  # Validations
  # ============
  validates :description, presence: true, length: { maximum: 100 }
end
