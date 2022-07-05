
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/categories' do
    categories = PlantCategory.all
    categories.to_json
  end

  post '/categories' do
    new_category = PlantCategory.create(name: params[:name], image_url: params[:image_url])
    new_category.to_json
  end

  get '/categories/:id' do
    category = PlantCategory.find(params[:id])
    category.to_json(include: {plants: {
      only: [:id, :name, :thumbnail_img, :scientific_name, :description, :locations, :created_at, :updated_at]
    }})
  end

  get '/plants' do
    plant_data = Plant.all
    plant_data.to_json
  end

  get '/plants/:id' do
    plant_data = Plant.find(params[:id])
    plant_data.to_json(include: {
      reviews: {only: [:id, :name, :content, :created_at, :updated_at]},
      plant_category: {only: [:name, :image_url]}
    })
  end

  get '/plants?q=:query' do
    # binding.pry
    result = Plant.where('name LIKE ?', "%#{params[:query]}%").all
    result.to_json
  end

  delete '/plants/:id' do
    plant = Plant.find(params[:id])
    plant.reviews.destroy_all
    plant.destroy
    plant.to_json
  end

  post '/reviews' do
    new_review = Review.create(
      name: params[:name],
      content: params[:content],
      plant_id: params[:plant_id]
    )
    new_review.to_json
  end

  post '/plants' do
    new_plant = Plant.create(
      name: params[:name],
      thumbnail_img: params[:thumbnail_img],
      cover_img: params[:cover_img],
      scientific_name: params[:scientific_name],
      description: params[:description],
      locations: params[:locations],
      plant_category_id: params[:plant_category_id]
    )
    new_plant.to_json
  end

  patch '/plants/:id' do
    plant = Plant.find(params[:id])
    plant.update(
      name: params[:name],
      thumbnail_img: params[:thumbnail_img],
      cover_img: params[:cover_img],
      scientific_name: params[:scientific_name],
      description: params[:description],
      locations: params[:locations],
      plant_category_id: params[:plant_category_id]
    )
  end
end
