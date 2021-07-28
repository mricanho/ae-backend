class CreateLectureGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :lecture_groups do |t|
      t.string :name
      t.string :description
      t.string :img_thumb
      t.string :shortname

      t.timestamps
    end
  end
end
