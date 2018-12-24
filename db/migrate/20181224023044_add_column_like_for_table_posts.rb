class AddColumnLikeForTablePosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :like, :integer
  end
end
