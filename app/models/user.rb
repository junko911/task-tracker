class User < ApplicationRecord
  has_secure_password

  has_many :task_logs, dependent: :destroy

  validates :email, presence: true

  def as_json(_options = nil)
    {
      id: id,
      email: email
    }
  end
end
