class AddIdToPostTags < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts_tags, :post, foreign_key: true
    add_reference :posts_tags, :tag, foreign_key: true
  end
end
