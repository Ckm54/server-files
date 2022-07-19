# require "pry"
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/categories' do
    categories = PlantCategory.all
    categories.to_json
  end

  post '/categories' do
    if params[:name] && params[:image_url] != nil
      new_category = PlantCategory.create(name: params[:name], image_url: params[:image_url])
      new_category.to_json
    end
  end

  get '/categories/:id' do
    category = PlantCategory.find(params[:id])
    category.to_json(include: {plants: {
      only: [:id, :name, :thumbnail_img, :cover_img, :scientific_name, :description, :locations, :created_at, :updated_at, :user_id, :plant_category_id]
      }})
  end

  delete '/categories/:id' do
    to_delete = PlantCategory.find(params[:id])
    to_delete.destroy
    to_delete.to_json
  end

  get '/plants' do
    plant_data = Plant.all
    plant_data.to_json(include: {user: {only: [:name]}})
  end

  get '/plants?q=:query' do
    # binding.pry
    result = Plant.where('name LIKE ?', "%#{params[:query]}%").all
    result.to_json
  end

  get '/plants/:id' do
    plant_data = Plant.find(params[:id])
    plant_data.to_json(include: {
      reviews: {only: [:name, :content, :created_at, :updated_at]},
      plant_category: {only: [:name, :image_url]},
      user: {only: [:name]}
    })
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
      plant_category_id: params[:plant_category_id],
      user_id: params[:user_id]
    )
    new_plant.to_json
  end

  put '/plants/:id' do
    plant = Plant.find(params[:id])
    plant.update(
      name: params[:name],
      thumbnail_img: params[:thumbnail_img],
      cover_img: params[:cover_img],
      scientific_name: parame[:scientific_name],
      description: params[:description],
      locations: params[:locations],
      plant_category_id: params[:plant_category_id]
    )
    plant.to_json
  end

  post '/signup' do
    @password = params[:password]
    @confirm_password = params[:confirm_password]
    @error = ""

    if @password != @confirm_password
      @error = "passwords do not match"
    # elsif username is already taken
    #   @error = "usename already exists"
    else
      @user = User.create({:name => params[:username], :password => params[:password], :email => params[:email]})
      @user.to_json
    end
  end

  get '/users' do
    users = User.all
    users.to_json
  end

  get '/users/:id' do
    user = User.find(params[:id])
    user.to_json(only: [:name])
  end

  get '/user/:email' do
    user = User.find_by(email: params[:email])
    user.to_json
  end
end
