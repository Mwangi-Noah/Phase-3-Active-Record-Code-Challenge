puts "🌱 Seeding data..."

#uUsed a previous class challenge as basis.
# Create dummy users
5.times do
  User.create(name: Faker::Name.name)
end

# Create dummy products
3.times do
  Product.create(name: Faker::Commerce.product_name)
end

# Leave reviews for products
Product.all.each do |product|
  User.all.sample(3).each do |user|
    star_rating = rand(1..5)
    comment = Faker::Lorem.sentence
    product.leave_review(user, star_rating, comment)
  end
end