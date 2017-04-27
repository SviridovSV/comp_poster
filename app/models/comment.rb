class Comment < ActiveRecord::Base
   belongs_to :commentable, polymorphic: true
   has_many :comments, as: :commentable
   scope :comment_order, -> { order('created_at ASC') }
   validates :body, presence: true
end
