class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction" , "Non-Fiction"] }

    validate :title_is_clickbait

    

    def title_is_clickbait
        clickbaits = [
            /Won't Believe/i,
            /Secret/i,
            /Top \d/i,
            /Guess/i
        ]

        if clickbaits.none? { |clickbait| clickbait.match title }
            errors.add(:title, 'must be clickbait')
        end
    end
end
