class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :title
      t.text :question
      t.text :facts
      t.text :conceptual_plan
      t.text :solution
      t.references :part, index: true

      t.timestamps
    end
  end
end
