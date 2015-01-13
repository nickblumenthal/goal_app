class Goal < ActiveRecord::Base
  validates :content, :visibility, :user_id, :status, presence: true

  include Commentable 
end
