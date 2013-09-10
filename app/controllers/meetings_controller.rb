class MeetingsController < ApplicationController
  # ============
  # Filters
  # ============
  before_filter(only: [:show, :all]) { |c| c.signed_in_filter USER_TYPE_ANY }
  before_filter(except: [:show, :all]) { |c| c.signed_in_filter USER_TYPE_PROFESSOR }

  # ============
  # Actions
  # ============
  def show
    @meeting = Meeting.find(params[:id])
  end

  def new
    thesis = Thesis.find params[:thesis_id]
    @meeting = thesis.meetings.build
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def create
    thesis = Thesis.find params[:meeting][:thesis_id]
    params[:meeting].delete :thesis_id
    @meeting = thesis.meetings.build(params[:meeting])

    if @meeting.save
      flash[:success] =  'Meeting was successfully created.'
      redirect_to @meeting
    else
      render 'new'
    end
  end

  def update
    @meeting = Meeting.find(params[:id])
    params[:meeting].delete :thesis_id

    if @meeting.update_attributes(params[:meeting])
      flash[:success] = 'Meeting was successfully updated.'
      redirect_to @meeting
    else
      render 'edit'
    end
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    thesis_id = @meeting.thesis.id
    @meeting.destroy
    flash[:success] = 'Meeting was successfully deleted.'
    redirect_to meetings_all_path(thesis_id)
  end

  def all
    @found_meetings = Meeting.find_all_by_thesis_id params[:thesis_id]
  end
end
