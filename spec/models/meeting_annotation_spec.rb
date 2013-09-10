# == Schema Information
#
# Table name: meeting_annotations
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  content        :text
#  attachment_url :string(255)
#  meeting_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

describe MeetingAnnotation do
  let(:thesis) { FactoryGirl.create :thesis }
  let(:meeting) { thesis.meetings.build meeting_date: Date.today }
  let(:annotation) { meeting.meeting_annotations.build title: 'A title', content: 'A content', attachment_url: 'http://any.url' }
  subject { annotation }

  # ============
  # Test for valid model
  # ============
  it { should respond_to :title }
  it { should respond_to :content }
  it { should respond_to :attachment_url }
  it { should respond_to :meeting_id }

  it { should be_valid }

  # =========
  # Accessible attributes
  # =========
  describe 'accessible attributes' do
    it 'should not allow access to meeting_id' do
      expect do
        MeetingAnnotation.new title: 'A title', content: 'A content', attachment_url: 'http://any.com', meeting_id: 1
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
  # Test for association
  # ============
  describe 'when thesis is deleted so should meetings associated' do
    let!(:annotation_id) { annotation.id }
    before { meeting.destroy }
    subject { MeetingAnnotation.find_by_id annotation_id }

    it { should be_nil }
  end
end
