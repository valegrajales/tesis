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

require 'spec_helper'

describe Student do
  let(:student) { FactoryGirl.create :student }
  subject { student }

  # ============
  # Test for valid model
  # ============
  it { should respond_to(:name) }
  it { should respond_to(:major) }
  it { should respond_to(:student_code) }
  it { should respond_to(:username) }
  it { should respond_to(:age) }
  it { should respond_to(:thesis) }

  it { should be_valid }

  # ============
  # Test for attribute presence
  # ============
  describe 'name should be present' do
    before { student.name = '' }
    it { should_not be_valid }
  end

  describe 'major should be present' do
    before { student.major = '' }
    it { should_not be_valid }
  end

  describe 'student_code should be present' do
    before { student.student_code = '' }
    it { should_not be_valid }
  end

  describe 'username should be present' do
    before { student.username = '' }
    it { should_not be_valid }
  end

  describe 'age should be present' do
    before { student.student_code = nil }
    it { should_not be_valid }
  end

  # ============
  # Test for name validation
  # ============
  describe 'name should have valid length' do
    before { student.name = 'a' * 201 }
    it { should_not be_valid }
  end

  # ============
  # Test for age validation
  # ============
  describe 'age should be more than zero' do
    before { student.age = 0}
    it { should_not be_valid }
  end

  # ============
  # Test for username uniquness
  # ============
  describe 'username must be unique' do
    let(:repeated_student) { student.dup }
    before { repeated_student.id = nil }
    subject { repeated_student }

    it { should_not be_valid }
  end

  describe 'username already exist' do
    let(:repeated_student_existence) { student.dup }
    before { repeated_student_existence.id = nil }
    subject { repeated_student_existence }

    it { should_not be_valid }
  end

end
