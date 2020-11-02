class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def featured
        self.posts.max_by { |post| post.likes }
    end

    def most_recent
        self.posts.reverse[0..4]
    end

    def blogger_avg
        self.bloggers.pluck(:age).sum / self.bloggers.count.to_f
    end
end
