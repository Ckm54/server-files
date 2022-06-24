class UpdateReviewsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :content
      t.integer :plant_id
      t.timestamps
    end
  end
end
