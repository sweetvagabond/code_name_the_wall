class Post < ActiveRecord::Base
belongs_to :user
belongs_to :parent, :class_name => "Post", :foreign_key => "post_id"
has_many :children, :class_name => "Post"

  validates :post, presence: true 
  validates_length_of :post, maximum: 10000 
end