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

require 'spec_helper'

describe Thesis do
  let(:thesis) { FactoryGirl.create(:thesis) }
  subject { thesis }

  # ============
  # Test for valid model
  # ============
  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:teacher) }
  it { should respond_to(:sources) }
  it { should respond_to(:products) }
  it { should respond_to(:meetings)  }
  it { should respond_to(:students) }

  it { should be_valid }

  # ============
  # Test for attribute presence
  # ============
  describe 'title should be present' do
    before { thesis.title = '' }
    it { should_not be_valid }
  end

  describe 'description should be present' do
    before { thesis.description = '' }
    it { should_not be_valid }
  end

  describe 'teacher should be present' do
    before { thesis.teacher = nil }
    it { should_not be_valid }
  end

  # ============
  # Test for title validation
  # ============
  describe 'title should have valid length' do
    before { thesis.title = 'a' * 101 }
    it { should_not be_valid }
  end

  # ============
  # Test for description validation
  # ============
  describe 'description should have valid length' do
    before { thesis.title = 'a' * 201 }
    it { should_not be_valid }
  end

end
