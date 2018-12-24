class RenameColumnPostsAndCommentsLikes < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :like, :likes_count
    rename_column :comments, :like, :likes_count
  end
end
