class TaskLog < ApplicationRecord
  belongs_to :task
  belongs_to :user

  def as_json(_options = nil)
    {
      id: id,
      start_time: start_time,
      end_time: end_time,
      user_id: user_id,
      task_id: task_id
    }
  end
end
