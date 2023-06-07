puts "🌱 Seeding data..."

user1 = User.create(name: "John")
user2 = User.create(name: "Jane")
product1 = Product.create(name: "Product 1")
product2 = Product.create(name: "Product 2")

product1.leave_review(user1, 5, "Great product!")
product1.leave_review(user2, 4, "Good product.")
product2.leave_review(user1, 3, "Average product.")

puts "User's favorite product: #{user1.favorite_product.name}"
puts "Average rating for Product 1: #{product1.average_rating}"

user1.remove_reviews(product1)

puts "Reviews for Product 1:"
product1.print_all_reviews