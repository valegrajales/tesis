require 'spec_helper'

describe UploaderHelper do

  describe 'delete_file_locally' do
    let(:file_path) { ::Rails.root.join 'imaginary_file.jpg' }

    context 'when file exists' do
      before do
        stream = File.open file_path, 'wb'
        stream.close
        UploaderHelper.delete_file_locally file_path
      end

      it 'should not exist after' do
        File.exists?(file_path).should be_false
      end
    end

    context 'when file does not exist' do
      it 'should not raise exception' do
        expect do
          UploaderHelper.delete_file_locally file_path
        end.not_to raise_error(Errno::ENOENT)
      end
    end
  end
end
