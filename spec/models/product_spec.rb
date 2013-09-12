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

require 'spec_helper'

describe Product do
  let(:thesis) { FactoryGirl.create(:thesis) }
  let(:product) { thesis.products.build description: 'Any description' }
  subject { product }

  # ============
  # Test for valid model
  # ============
  it { should respond_to(:description) }
  it { should respond_to(:thesis) }

  it { should be_valid }

  # ============
  # Test for mass assignment
  # ============
  describe 'accessible attributes' do
    it 'should not allow access to thesis_id' do
      expect do
        Product.new description: 'Some description', thesis_id: 1
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  # ============
  # Test for attribute presence
  # ============
  describe 'description should be present' do
    before { product.description = '' }
    it { should_not be_valid }
  end

  # ============
  # Test for description validation
  # ============
  describe 'description should have valid length' do
    before { product.description = 'a' * 101 }
    it { should_not be_valid }
  end

  # ============
  # Test for associations
  # ============
  describe 'when thesis is deleted so should sources associated' do
    let!(:product_id) { product.id }
    before { thesis.destroy }
    subject { Product.find_by_id product_id }

    it { should be_nil }
  end

  describe 'when user visits page list products and thesis_id equals 201 and there\'s 10 products' do
    let!(:thesis_id){201}
    before {}
  end
end
