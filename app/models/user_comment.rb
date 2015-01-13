class UserComment < ActiveRecord::Base
  validates :content, :author_id, :user_id, presence: true

  belongs_to :user
end
