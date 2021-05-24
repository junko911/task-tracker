class CreateTaskLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :task_logs do |t|
      t.integer :duration_minutes
      t.references :task, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
