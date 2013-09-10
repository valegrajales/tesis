module UploaderHelper
  # ============
  # Constants
  # ============

  # The bucket name used in S3 service
  BUCKET_NAME = 'tesis.uniandes.edu.co'
  BASE_OBJECT_URL = 'https://s3.amazonaws.com/tesis.uniandes.edu.co/'
  ACCESS_KEY_ID = 'AKIAIC7OJ7DE6H5UNAXQ'
  SECRET_ACCESS_KEY = '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'
  LOCAL_TEMPORARY_PATH = "#{::Rails.root.join 'public', 'attachments'}"

  # ============
  # Static methods
  # ============

  # Uploads a file to AWS S3 services
  # Params:
  # +key+:: The key with which the object is stored
  # +file_path+:: The file path of the object in the local machine
  def self.upload_object(key, file_path)
    # Setups the connection and creates bucket if it does not exist
    UploaderHelper.setup_connection unless UploaderHelper.connected?
    # Uploads the object
    AWS::S3::S3Object.store key, open(file_path), BUCKET_NAME, access: :public_read
    # Increases counter of requests or sets it to 1 if nil
    @s3_request_counter ? @s3_request_counter += 1 : 1
    # Disconnects if requests get to 80
    UploaderHelper.disconnect if @s3_request_counter == 80
    # Returns public url
    BASE_OBJECT_URL + key
  end

  # Saves a file locally after it is uploaded via the browser
  # Params:
  # +uploaded_file+:: The uploaded file
  def self.save_file_locally(uploaded_file)
    # Creates the local temporary path
    unless Dir.exists? LOCAL_TEMPORARY_PATH
      Dir.mkdir LOCAL_TEMPORARY_PATH
    end
    # Gets the file name
    file_path = File.join LOCAL_TEMPORARY_PATH, uploaded_file.original_filename
    # Writes the file
    File.open(file_path, 'wb') { |f| f.write(uploaded_file.read) }
    # Returns the file_path
    file_path
  end

  # Deletes a file locally given a certain path
  # Params:
  # +file_path+:: The file path of the file to delete
  def self.delete_file_locally(file_path)
    File.delete file_path if File.exists? file_path
  end

  # ============
  # Internally private methods
  # ============
  private
  def self.setup_connection
    unless UploaderHelper.connected?
      AWS::S3::Base.establish_connection! access_key_id: ACCESS_KEY_ID,
                                          secret_access_key: SECRET_ACCESS_KEY,
                                          use_ssl: true
    end
    UploaderHelper.setup_bucket
  end

  def self.setup_bucket
    begin
      AWS::S3::Bucket.find BUCKET_NAME
    rescue
      # AWS::S3::NoSuchBucket exception
      AWS::S3::Bucket.create BUCKET_NAME
    end
  end

  def self.connected?
    AWS::S3::Base.connected?
  end

  def self.disconnect
    AWS::S3::Base.disconnect
  end

end