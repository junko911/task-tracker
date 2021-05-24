class Task < ApplicationRecord
  belongs_to :project
  has_many :task_logs, dependent: :destroy

  validates :description, presence: true
end
