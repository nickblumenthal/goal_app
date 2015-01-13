class GoalComment < ActiveRecord::Base
  validates :content, :author_id, :goal_id, presence: true

  belongs_to :goal
end
