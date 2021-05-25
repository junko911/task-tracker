class Project < ApplicationRecord
  belongs_to :customer
  has_many :tasks, dependent: :destroy

  validates :name, presence: true
  
  def as_json(_options = nil)
    {
      id: id,
      name: name,
      customer_id: customer_id
    }
  end
end
