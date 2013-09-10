class SourceAnnotationsController < ApplicationController
  # ============
  # Filters
  # ============
  before_filter { |c| c.signed_in_filter USER_TYPE_ANY }

  # ============
  # Actions
  # ============
  def new
    source = Source.find params[:source_id]
    @source_annotation = source.source_annotations.build
  end

  def create
    source = Source.find params[:source_annotation][:source_id]
    params[:source_annotation].delete :source_id
    @source_annotation = source.source_annotations.build(params[:source_annotation])
    if @source_annotation.save
      flash[:success] = 'Your annotation has been created successfully.'
      redirect_to @source_annotation
    else
      render 'new'
    end
  end

  def show
    @source_annotation = SourceAnnotation.find(params[:id])
  end

  def all
    @source_annotations = SourceAnnotation.find_all_by_source_id(params[:source_id])
  end
end
