def url_generator
  numbers = (1..10)
  urls = []
  numbers.each do |number|
    car_url = "https://freetestapi.com/api/v1/cars/#{number}"
    urls << car_url
  end
  urls
end

def car_generator
  urls = url_generator
  urls.each do |url|
    car_serialized = URI.parse(url).read
    car = JSON.parse(car_serialized)
    brand = car["make"]
    model = car["model"]
    year = car["year"]
    fuel = car["fuelType"]
    owner = Owner.all.sample
    Car.create!(brand: brand, model: model, year: year, fuel: fuel, owner: owner)
  end
end

def owner_generator
  owners = ["Killian", "Robert-Gordon", "Samy", "Russell", "McLay", "Ceejay", "Neco", "Eljay", "Ayrton", "Connell"]
  owners.each do |owner|
    p Owner.create!(nickname: owner)
  end
end

puts "Cleaning database..."
Review.destroy_all
Favourite.destroy_all
Car.destroy_all
Owner.destroy_all


puts "Creating owners..."
owner_generator
puts "Created #{Owner.count} owners!"
puts "Creating cars..."
car_generator
puts "Created #{Car.count} cars!"
puts "FINISHED"


image_urls = ["https://media.autoexpress.co.uk/image/private/s--X-WVjvBW--/f_auto,t_content-image-full-desktop@1/v1666871126/autoexpress/2022/10/Toyota%20Corolla%20GR%20Sport%202022%20UK-8.jpg","https://media.autoexpress.co.uk/image/private/s--X-WVjvBW--/f_auto,t_content-image-full-desktop@1/v1622200010/autoexpress/2021/05/Honda%20Civic%20Type%20R%20Sport%20Line-17.jpg","https://a57.foxnews.com/static.foxnews.com/foxnews.com/content/uploads/2019/08/1200/675/shel1.jpg?ve=1&tl=1", "https://media.assets.sincrod.com/websites/content/gmps-scottcars/progressive-2.0/d0a899ca8b7a4765973f3fc870b04cc7_c364x0-972x417.jpg", "https://hips.hearstapps.com/hmg-prod/images/2019-nissan-altima-102-1538074559.jpg", "last was nissan altima"]
