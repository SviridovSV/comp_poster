class Poster < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  scope :default_order, -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
