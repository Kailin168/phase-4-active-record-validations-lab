class Post < ApplicationRecord

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: [ 'Fiction', 'Non-Fiction' ] }

  validate :clickbaits

  ClickPattern = [
    /Wont's Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i

  ]

  def clickbaits
    if ClickPattern.none? { |pattern| pattern.match title }
    errors.add(:title, "must be clickbaits")
    end
  
  end

end
