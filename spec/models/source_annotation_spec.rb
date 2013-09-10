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

require 'spec_helper'

describe SourceAnnotation do
  let(:thesis) { FactoryGirl.create(:thesis) }
  let(:source) do
    thesis.sources.create(title: 'Any title',
                          description: 'Some description',
                          reference: 'The reference',
                          source_type_id: 1)
  end
  let(:annotation) { source.source_annotations.create(title: 'Any title', content: 'Some content') }
  subject { annotation }

  # ============
  # Test for valid model
  # ============
  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:source) }

  it { should be_valid }

  # ============
  # Test for mass assignment
  # ============
  describe 'accessible attributes' do
    it 'should not allow access to source_id' do
      expect do
        SourceAnnotation.new(title: 'Any title',
                             content: 'Some content',
                             source_id: 1
        )
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  # ============
  # Test for attribute presence
  # ============
  describe 'title should be present' do
    before { annotation.title = '' }
    it { should_not be_valid }
  end

  describe 'content should be present' do
    before { annotation.content = '' }
    it { should_not be_valid }
  end

  # ============
  # Test for title validation
  # ============
  describe 'title should have valid length' do
    before { annotation.title = 'a' * 101 }
    it { should_not be_valid }
  end

  # ============
  # Test for associations
  # ============
  describe 'when thesis is deleted so should sources associated' do
    let!(:annotations_id) { annotation.id }
    before { source.destroy }
    subject { SourceAnnotation.find_by_id annotations_id }

    it { should be_nil }
  end
end
