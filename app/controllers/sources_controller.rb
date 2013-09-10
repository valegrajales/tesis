class SourcesController < ApplicationController
  # ============
  # Filters
  # ============
  before_filter(execpt: [:new, :create]) { |c| c.signed_in_filter USER_TYPE_ANY }
  before_filter(only: [:new, :create]) { |c| c.signed_in_filter USER_TYPE_STUDENT }

  # ============
  # Actions
  # ============
  def all
    thesis_id = params[:thesis_id]
    if params[:order_by]
      @found_sources = Source.scoped_find_all_by_thesis_id(thesis_id).order(params[:order_by])
    else
      @found_sources = Source.find_all_by_thesis_id thesis_id
    end
  end

  def new
    thesis = Thesis.find params[:thesis_id]
    @source = thesis.sources.build
  end

  def create
    thesis = Thesis.find params[:source][:thesis_id]
    @source = thesis.sources.build(title: params[:source][:title],
                                   description: params[:source][:description],
                                   reference: params[:source][:reference],
                                   source_type_id: params[:source][:source_type_id])

    # Upload file
    if params[:upload]
      uploaded_file = params[:upload][:datafile]
      # Saves the file locally an obtains it's path
      file_path = UploaderHelper.save_file_locally uploaded_file
      # Uploads the file to the S3 service and obtains it's URL
      attachment_url = UploaderHelper.upload_object uploaded_file.original_filename, file_path
      # Updates the meeting annotation object
      @source.attachment_url = attachment_url
      # Deletes the object since it's not longer needed
      UploaderHelper.delete_file_locally file_path
    end

    if @source.save
      flash[:success] = 'Your source has been created successfully.'
      redirect_to @source
    else
      render 'new'
    end
  end

  def show
    @source = Source.find(params[:id])
  end

end
