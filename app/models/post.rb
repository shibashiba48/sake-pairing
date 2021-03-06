class Post < ApplicationRecord
  has_many :posts_tags
  has_many :tags, dependent: :destroy, through: :posts_tags
  accepts_nested_attributes_for :tags, allow_destroy: true
  belongs_to :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :comments, dependent: :destroy

  validates :name, :text, presence: true

  def self.search(search)
    return Post.all unless search
    Post.joins(:tags).where('tags.text LIKE(?)', "%#{search}%")
  end
end