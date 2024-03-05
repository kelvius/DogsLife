class Owner < ApplicationRecord
  has_many :dogs

  validates :name, presence: true
  validates :address, presence: true, length: { minimum: 3 }

  Visible::VALID_STATUSES ['public', 'private', 'archived']

  validates :status, inclusion: { in: VALID_STATUSES }

  def archived?
    status == 'archived'
  end
end
