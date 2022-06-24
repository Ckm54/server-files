require 'faker'
puts "🌱 Seeding data..."

Review.delete_all
PlantCategory.delete_all
Plant.delete_all

PlantCategory.create(name: "Fruits", image_url: "https://cdn.pixabay.com/photo/2016/11/30/15/23/apples-1873078__340.jpg")
PlantCategory.create(name: "Vegetables", image_url: "https://cdn.pixabay.com/photo/2016/03/05/19/02/vegetables-1238252__340.jpg")
PlantCategory.create(name: "Herbs", image_url: "https://cdn.pixabay.com/photo/2016/05/23/15/16/herbal-tea-1410565__340.jpg")
PlantCategory.create(name: "Flowers", image_url: "https://cdn.pixabay.com/photo/2014/01/22/19/44/flower-field-250016__340.jpg")

5.times do 
  Plant.create(name: "Watermelon", thumbnail_img: "https://cdn.pixabay.com/photo/2015/06/19/16/48/watermelon-815072__340.jpg", cover_img: "https://cdn.pixabay.com/photo/2015/06/19/16/48/watermelon-815072__340.jpg", scientific_name: Faker::Lorem.words.join(" "), description: Faker::Lorem.paragraph, locations: Faker::Lorem.word, plant_category_id: rand(1..PlantCategory.all.size))
  Plant.create(name: "Parsely", thumbnail_img: "https://cdn.pixabay.com/photo/2019/12/11/16/20/parsley-4688651__340.jpg", cover_img: "https://cdn.pixabay.com/photo/2019/12/11/16/20/parsley-4688651__340.jpg", scientific_name: Faker::Lorem.words.join(" "), description: Faker::Lorem.paragraph, locations: Faker::Lorem.word, plant_category_id: rand(1..PlantCategory.all.size))
  Plant.create(name: "Marigold", thumbnail_img: "https://cdn.pixabay.com/photo/2016/08/04/09/19/marigold-1568646__340.jpg", cover_img: "https://cdn.pixabay.com/photo/2015/08/05/21/22/silver-bordered-fritillary-877121__340.jpg", scientific_name: Faker::Lorem.words.join(" "), description: Faker::Lorem.paragraph, locations: Faker::Lorem.word, plant_category_id: rand(1..PlantCategory.all.size))
  Plant.create(name: "Kales", thumbnail_img: "https://cdn.pixabay.com/photo/2019/11/21/16/05/kale-4642858__340.jpg", cover_img: "https://cdn.pixabay.com/photo/2018/09/28/20/39/vegetables-3710173__340.jpg", scientific_name: Faker::Lorem.words.join(" "), description: Faker::Lorem.paragraph, locations: Faker::Lorem.word, plant_category_id: rand(1..PlantCategory.all.size))
end

50.times do
  review = Faker::Lorem.sentences.join(" ")
  name = Faker::Name.name
  p_id = rand(1..Plant.all.count)

  Review.create(name: name, content: review, plant_id: p_id)
end


puts "🌱 Done seeding!"