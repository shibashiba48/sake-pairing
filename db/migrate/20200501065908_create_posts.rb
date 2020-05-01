class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name, null: false
      t.string :type, null: false
      t.text :text, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
