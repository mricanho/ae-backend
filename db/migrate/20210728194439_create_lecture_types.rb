class CreateLectureTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :lecture_types do |t|
      t.references :lecture, null: false, foreign_key: true
      t.references :lecture_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
