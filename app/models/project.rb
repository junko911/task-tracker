class Project < ApplicationRecord
  belongs_to :customer
  has_many :tasks, dependent: :destroy

  validates :name, presence: true
end
