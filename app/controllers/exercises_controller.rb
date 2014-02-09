class ExercisesController < ApplicationController
  
  def new
    @part = Part.find(params[:format])
  end

  def create
    @part = Part.find(params.require(:exercise).require(:part_id))
    @exercise = @part.exercises.create(params.require(:exercise).permit(:title))
    @exercise.save
    redirect_to @exercise
  end

  def show
    @exercise = Exercise.find(params[:id])
    @part = Part.find(@exercise.part_id)
  end

  def update
    @exercise = Exercise.find(params.permit(:id)[:id])
    
    params.permit(:question, :facts, :conceptual_plan, :solution).each { |key, value|
      @exercise[key] = value
    }
    @exercise.save
    
    render :nothing => true, :status => 200, :content_type => 'text/html'
  end

end
