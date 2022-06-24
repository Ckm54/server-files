class Plant < ActiveRecord::Base
  has_many :reviews
  belongs_to :plant_category
end