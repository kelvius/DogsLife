class Owner < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true, length: { minimum: 3 }
end
