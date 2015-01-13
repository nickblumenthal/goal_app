class Goal < ActiveRecord::Base
  validates :content, :visibility, :user_id, :status, presence: true

  has_many(
    :comments,
    class_name: 'GoalComment',
    foreign_key: :goal_id,
    primary_key: :id
  )
end
