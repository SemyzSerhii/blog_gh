class AddColumnPublishedForTablePosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :published, :boolean, default: false
  end
end