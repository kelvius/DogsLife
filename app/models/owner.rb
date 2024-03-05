class Owner < ApplicationRecord
include Visible

  has_many :dogs

  validates :name, presence: true
  validates :address, presence: true, length: { minimum: 3 }

end
