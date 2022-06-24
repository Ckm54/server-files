class RemoveReviewIdColumnFromPlants < ActiveRecord::Migration[6.1]
  def change
    remove_column :plants, :review_id
  end
end
