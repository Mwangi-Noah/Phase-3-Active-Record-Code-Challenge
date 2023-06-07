# run.rb
require 'active_record'
require_relative '../app/models/review'
require_relative '../app/models/product'
require_relative '../app/models/user'

# Configure ActiveRecord connection
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: ':memory:'
)

# Run migrations
require_relative '../db/migrate/001_create_reviews'

# Load seed data
require_relative '../db/seeds'

# Test the methods
puts "User's favorite product: #{User.first.favorite_product.name}"
puts "Average rating for Product 1: #{Product.first.average_rating}"

User.first.remove_reviews(Product.first)

puts "Reviews for Product 1:"
Product.first.print_all_reviews

puts "Average rating for Product 2: #{Product.first.average_rating}"
