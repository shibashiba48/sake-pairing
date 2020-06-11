class Tag < ApplicationRecord
  has_many :posts_tags
  has_many :posts, through: :posts_tags

  validates :text, presence: true

  def self.search(search)
    return Tag.all unless search
    Tag.where('text LIKE(?)', "%#{search}%")
  end

end
