class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :category, inclusion: { in: %w(Fiction Nonfiction)}
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validate :clickbait

  def clickbait
    if !title
      errors.add(:title, "is not valid")
    elsif title !=
      unless title.include? ("Won't Believe") || title.include?("Secret") || title.include?("Top
        [number]") || title.include?("Guess")
        errors.add(:title, "is not clickbaity enough")
      end
    end
  end
  # def clickbait
  #   .include?
  # end
end
