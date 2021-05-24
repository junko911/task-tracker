class Project < ApplicationRecord
  belongs_to :customer
  has_many :tasks

  validates :name, presence: true
end
