class TaskLog < ApplicationRecord
  belongs_to :task
  belongs_to :user

  def as_json(_options = nil)
    {
      id: id,
      duration_minutes: duration_minutes,
      user_id: user_id,
      task_id: task_id
    }
  end
end
