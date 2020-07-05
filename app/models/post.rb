class Post < ApplicationRecord
  has_many :posts_tags
  has_many :tags, dependent: :destroy, through: :posts_tags
  accepts_nested_attributes_for :tags, allow_destroy: true
  belongs_to :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  accepts_nested_attributes_for :favorites, allow_destroy: true
  has_many :iine_users, through: :favorites, source: :user

  validates :name, :text, presence: true

  def self.search(search)
    return Post.all unless search
    Post.joins(:tags).where('tags.text LIKE(?)', "%#{search}%")
  end

  # postをいいねする
  def iine(user)
    favorites.create(user_id: user.id)
  end

  # postのいいねを解除する
  def uniine(user)
    favorites.find_by(user_id: user.id).destroy
  end

  # 現在のユーザーがいいねしてたらtrueを返す
  def iine?(user)
    iine_users.include?(user)
  end

end