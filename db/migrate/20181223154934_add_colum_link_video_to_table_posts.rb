class AddColumLinkVideoToTablePosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :link_video, :string
  end
end
