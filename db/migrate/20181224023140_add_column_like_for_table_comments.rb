class AddColumnLikeForTableComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :like, :integer
  end
end
