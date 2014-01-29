class Comment < ActiveRecord::Base
  belongs_to :userable, polymorphic: true
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  validates :comment, presence: true
  validates_length_of :comment, maximum: 10000
end
