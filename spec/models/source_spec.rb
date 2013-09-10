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

require 'spec_helper'

describe Source do
  let(:thesis) { FactoryGirl.create(:thesis) }
  let(:source) do
    thesis.sources.create(title: 'Any title',
                          description: 'Some description',
                          reference: 'The reference',
                          source_type_id: 1)
  end
  subject { source }

  # ============
  # Test for valid model
  # ============
  it { should respond_to(:description) }
  it { should respond_to(:source_type_id) }
  it { should respond_to(:title) }
  it { should respond_to(:reference) }
  it { should respond_to(:thesis) }
  it { should respond_to(:source_annotations) }

  it { should be_valid }

  # ============
  # Test for mass assignment
  # ============
  describe 'accessible attributes' do
    it 'should not allow access to thesis_id' do
      expect do
        Source.new(title: 'Any title',
                   description: 'Some description',
                   reference: 'The reference',
                   source_type_id: 1,
                   thesis_id: 1
        )
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  # ============
  # Test for attribute presence
  # ============
  describe 'description should be present' do
    before { source.description = '' }
    it { should_not be_valid }
  end

  describe 'source_type_id should be present' do
    before { source.source_type_id = '' }
    it { should_not be_valid }
  end

  describe 'title should be present' do
    before { source.title = '' }
    it { should_not be_valid }
  end

  describe 'reference should be present' do
    before { source.reference = '' }
    it { should_not be_valid }
  end

  # ============
  # Test for title validation
  # ============
  describe 'description should have valid length' do
    before { source.description = 'a' * 101 }
    it { should_not be_valid }
  end

  # ============
  # Test for associations
  # ============
  describe 'when thesis is deleted so should sources associated' do
    let!(:source_id) { source.id }
    before { thesis.destroy }
    subject { Source.find_by_id source_id }

    it { should be_nil }
  end

  describe 'scoped_find_all_by_thesis_id scope' do
    let(:another_thesis) { FactoryGirl.create(:thesis) }
    before do
      # Creates more than one for the thesis
      5.times do
        thesis.sources.create(title: 'Any title',
                              description: 'Some description',
                              reference: 'The reference',
                              source_type_id: 1)
      end
      # Creates sources for another thesis
      5.times do
        another_thesis.sources.create(title: 'Any title',
                              description: 'Some description',
                              reference: 'The reference',
                              source_type_id: 1)
      end
    end
    let(:all) { Source.find_all_by_thesis_id thesis.id }
    let(:scope) { Source.scoped_find_all_by_thesis_id thesis.id }

    it 'should have the same count as find_all_by_thesis_id' do
      all.count.should == scope.count
    end

    it 'should be less than the total count of sources' do
      scope.count.should < Source.all.count
    end
  end
end
