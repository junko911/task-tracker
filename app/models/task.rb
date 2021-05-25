class Task < ApplicationRecord
  belongs_to :project
  has_many :task_logs, dependent: :destroy

  validates :description, presence: true

  def as_json(_options = nil)
    {
      id: id,
      description: description,
      project_id: project_id
    }
  end
end
