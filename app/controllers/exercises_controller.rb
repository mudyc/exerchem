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

end
