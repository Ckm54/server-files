class RenameCategoriesToPlantCategories < ActiveRecord::Migration[6.1]
  def change
    rename_table :categories, :plant_categories
  end
end
