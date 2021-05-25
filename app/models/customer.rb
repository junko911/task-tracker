class Customer < ApplicationRecord
  validates :name, presence: true

  has_many :projects, dependent: :destroy

  def as_json(_options = nil)
    {
      id: id,
      name: name
    }
  end
end
