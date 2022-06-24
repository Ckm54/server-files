class RenameCategoryIdColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :plants, :category_id, :plant_category_id
  end
end
