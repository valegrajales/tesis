# == Schema Information
#
# Table name: students
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  major        :string(255)
#  student_code :string(255)
#  username     :string(255)
#  age          :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  thesis_id    :integer
#

class Student < ActiveRecord::Base
  attr_accessible :age, :major, :name, :student_code, :username

  # ============
  # Associations
  # ============
  belongs_to :thesis

  # ============
  # Validations
  # ============
  validates :age, presence: true, numericality: { greater_than: 0 }
  validates :major, presence: true
  validates :name, presence: true, length: { maximum: 200 }
  validates :student_code, presence: true
  validates :username, presence: true, uniqueness: true
end
