class AddTextToTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :text, :text
  end
end
