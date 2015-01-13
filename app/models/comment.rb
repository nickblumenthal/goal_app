class Comment < ActiveRecord::Base
  validates :content, :author_id, :commentable_type, :commentable_id, presence: true

  belongs_to :commentable, polymorphic: true
end
