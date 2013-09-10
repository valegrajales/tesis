class MeetingAnnotationsController < ApplicationController
  # ============
  # Filters
  # ============
  before_filter { |c| c.signed_in_filter USER_TYPE_ANY }

  # ============
  # Actions
  # ============
  def new
    meeting = Meeting.find_by_id params[:meeting_id]
    if meeting
      @meeting_annotation = meeting.meeting_annotations.build
    else
      flash.now[:error] = "The meeting identification #{params[:meeting_id]} does not exist."
    end
  end

  def create
    meeting = Meeting.find_by_id params[:meeting_annotation][:meeting_id]
    # Creates the meeting annotation
    @meeting_annotation = meeting.meeting_annotations.build(title: params[:meeting_annotation][:title],
                                                            content: params[:meeting_annotation][:content])
    # Upload file
    if params[:upload]
      uploaded_file = params[:upload][:datafile]
      # Saves the file locally an obtains it's path
      file_path = UploaderHelper.save_file_locally uploaded_file
      # Uploads the file to the S3 service and obtains it's URL
      attachment_url = UploaderHelper.upload_object uploaded_file.original_filename, file_path
      # Updates the meeting annotation object
      @meeting_annotation.attachment_url = attachment_url
      # Deletes the object since it's not longer needed
      UploaderHelper.delete_file_locally file_path
    end

    # Saves the file
    if @meeting_annotation.save
      flash[:success] = 'Your annotation has been created successfully.'
      redirect_to @meeting_annotation
    else
      render 'new'
    end
  end

  def show
    @meeting_annotation = MeetingAnnotation.find(params[:id])
  end
end
