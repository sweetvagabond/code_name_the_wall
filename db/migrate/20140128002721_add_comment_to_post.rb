class AddCommentToPost < ActiveRecord::Migration
  def change
    add_reference :posts, :post, index: true
  end
end
