class AddImageToLecture < ActiveRecord::Migration[6.1]
  def change
    add_column :lectures, :img_thumb, :string
  end
end
