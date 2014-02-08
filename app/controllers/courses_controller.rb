class CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def new
  end

  def create
    @course = Course.new(params[:post].permit(:course))
    @course.save
    redirect_to @course
  end

  def show
    @course = Course.find(params[:id])
  end

end
