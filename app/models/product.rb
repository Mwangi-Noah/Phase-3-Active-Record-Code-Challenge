class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews
  
    def leave_review(user, star_rating, comment)
      Review.create(user: user, product: self, star_rating: star_rating, comment: comment)
    end
  
    def print_all_reviews
      reviews.each do |review|
        review.print_review
      end
    end
  
    def average_rating
      ratings_sum = reviews.sum(:star_rating)
      ratings_count = reviews.count
      ratings_count > 0 ? (ratings_sum.to_f / ratings_count) : 0.0
    end
end