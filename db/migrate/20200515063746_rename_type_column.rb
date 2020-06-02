class RenameTypeColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :type, :tag
  end
end
