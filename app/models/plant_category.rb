class PlantCategory < ActiveRecord::Base
  has_many :plants
  has_many :reviews, through: :plants
end
