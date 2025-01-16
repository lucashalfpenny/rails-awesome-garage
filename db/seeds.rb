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
