puts "🌱 Seeding data..."

user1 = User.create(name: "Noah")
user2 = User.create(name: "Mwangi_N")
user3 = User.create(name: "Nora")
product1 = Product.create(name: "Dell Optiplex")
product2 = Product.create(name: "Compaq")

product1.leave_review(user1, 5, "Great product!")
product1.leave_review(user2, 4, "Good product.")
product2.leave_review(user1, 3, "Average product.")

puts "User's favorite product: #{user1.favorite_product.name}"
puts "Average rating for Product 1: #{product1.average_rating}"

user1.remove_reviews(product1)

puts "Reviews for Product 1:"
product1.print_all_reviews