class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :title
      t.references :course, index: true

      t.timestamps
    end
  end
end
