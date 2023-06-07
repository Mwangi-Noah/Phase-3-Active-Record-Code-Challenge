class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews
  
    def favorite_product
      reviews.order(star_rating: :desc).first.product
    end
  
    def remove_reviews(product)
      reviews.where(product_id: product.id).destroy_all
    end
end