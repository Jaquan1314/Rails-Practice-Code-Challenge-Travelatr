class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30,
        too_short: "%{30} characters is the minimum allowed" 
    }

    def total_likes
        self.posts.pluck(:likes).sum
    end

    def top_post
        self.posts.max_by { |post| post.likes }
    end
end
