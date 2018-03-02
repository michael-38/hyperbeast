# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Footwear'
cat3 = Category.find_or_create_by! name: 'Accessories'

## PRODUCTS

puts "Re-creating Seed Products ..."

Product.destroy_all

cat1.products.create!({
  name:  'COMMES DES GARCONS HOODIE',
  image: open_asset('apparel0.jpg'),
  quantity: 6,
  price: 126.00
})


cat1.products.create!({
  name:  'COMMES DES GARCONS HOODIE',
  image: open_asset('apparel1.jpg'),
  quantity: 3,
  price: 126.00
})


cat1.products.create!({
  name:  'ADIDAS X NEIGHBORHOOD ',
  image: open_asset('apparel3.jpg'),
  quantity: 23,
  price: 95.00
})

cat1.products.create!({
  name:  'STONE ISLAND HOODIE ',
  image: open_asset('apparel4.jpg'),
  quantity: 31,
  price: 136.00
})


cat1.products.create!({
  name:  'STONE ISLAND HOODIE ',
  image: open_asset('apparel5.jpg'),
  quantity: 30,
  price: 136.00
})


cat2.products.create!({
  name:  'ADIDAS NMD R2 / CORE BLACK',
  image: open_asset('footwear1.jpg'),
  quantity: 6,
  price: 265.00
})

cat2.products.create!({
  name:  'ADIDAS NMD R2 / WHITE',
  image: open_asset('footwear2.jpg'),
  quantity: 8,
  price: 265.00
})


cat2.products.create!({
  name:  'Y-3 SAIKOU / CORE WHITE',
  image: open_asset('footwear4.jpg'),
  quantity: 22,
  price: 225.00
})

cat2.products.create!({
  name:  'Y-3 SAIKOU / CORE BLACK',
  image: open_asset('footwear5.jpg'),
  quantity: 16,
  price: 225.00
})

cat2.products.create!({
  name:  'NIKE AIR MAX 270 QS / HOT PUNCH',
  image: open_asset('footwear6.jpg'),
  quantity: 2,
  price: 204.50
})


cat2.products.create!({
  name:  'NIKE AIR MAX 270 QS / TOTAL ORANGE',
  image: open_asset('footwear7.jpg'),
  quantity: 4,
  price: 204.50
})

cat2.products.create!({
  name:  'NIKE AIR JORDAN 1',
  image: open_asset('footwear10.jpg'),
  quantity: 10,
  price: 169.50
})


cat2.products.create!({
  name:  'NIKE AIR JORDAN 1',
  image: open_asset('footwear11.jpg'),
  quantity: 20,
  price: 169.50
})





cat3.products.create!({
  name:  'NEIGHBORHOOD SRL /EC-CAP',
  image: open_asset('accessory1.jpg'),
  quantity: 12,
  price: 24.50
})


cat3.products.create!({
  name:  'NEIGHBORHOOD SRL /EC-CAP',
  image: open_asset('accessory2.jpg'),
  quantity: 8,
  price: 24.50
})




puts "Re-creating Seed Users ..."

User.create!({
  name: 'michael38',
  email: 'aaa@email.com',
  password: 'abc'
})

User.create!({
  name: 'joanne_12',
  email: 'bbb@email.com',
  password: 'abc'
})

 puts "Re-creating Seed Reviews ..."

Review.destroy_all

Review.create!({
  product_id: 6,
  user_id: 1,
  description: 'Really comfortable! Love these shoes!',
  rating: 4
})

Review.create!({
  product_id: 6,
  user_id: 2,
  description: 'I love this so much <3',
  rating: 5
})

Review.create!({
  product_id: 8,
  user_id: 1,
  description: 'Amazing!!',
  rating: 5
})


puts "DONE!"
