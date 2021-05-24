class User < ApplicationRecord
  has_secure_password

  has_many :task_logs

  validates :email, presence: true
end
