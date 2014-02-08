class PartsController < ApplicationController

  def new
    @course = Course.find(params[:format])
  end

  def create
    @course = Course.find(params.require(:part).require(:course_id))
    @part = @course.parts.create(params.require(:part).permit(:title))
    @part.save
    redirect_to @part
  end

  def show
    @part = Part.find(params[:id])
    @course = Course.find(@part.course_id)
  end

end
