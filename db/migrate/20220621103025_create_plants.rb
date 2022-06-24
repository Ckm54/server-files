class CreatePlants < ActiveRecord::Migration[6.1]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :thumbnail_img
      t.string :cover_img
      t.string :scientific_name
      t.string :description
      t.string :locations
      t.integer :category_id
      t.integer :review_id
      t.timestamps
    end
  end
end
