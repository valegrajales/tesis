# == Schema Information
#
# Table name: meetings
#
#  id           :integer          not null, primary key
#  meeting_date :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  thesis_id    :integer
#

require 'spec_helper'

describe Meeting do
  let(:thesis) { FactoryGirl.create :thesis }
  let(:meeting) { thesis.meetings.build meeting_date: Date.today }
  subject { meeting }

  # ============
  # Test for valid model
  # ============
  it { should respond_to :meeting_date }
  it { should respond_to :meeting_annotations }
  it { should respond_to :thesis }

  it { should be_valid }

  # ============
  # Test for mass assignment
  # ============
  describe 'accessible attributes' do
    it 'should not allow access to thesis_id' do
      expect do
        Source.new(meeting_date: Date.today, thesis_id: 1)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  # ============
  # Test for association
  # ============
  describe 'when thesis is deleted so should meetings associated' do
    let!(:meeting_id) { meeting.id }
    before { thesis.destroy }
    subject { Meeting.find_by_id meeting_id }

    it { should be_nil }
  end

  describe 'when meeting_date is today' do
    before { meeting.meeting_date = Date.today }
    it { should be_valid }
  end

end
