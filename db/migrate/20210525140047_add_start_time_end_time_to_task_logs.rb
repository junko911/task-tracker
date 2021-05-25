class AddStartTimeEndTimeToTaskLogs < ActiveRecord::Migration[6.1]
  def change
    remove_column :task_logs, :duration_minutes
    add_column :task_logs, :start_time, :datetime
    add_column :task_logs, :end_time, :datetime
  end
end
