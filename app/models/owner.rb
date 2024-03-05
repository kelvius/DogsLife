class Owner < ApplicationRecord
  validates :name, presence: true
  validates :body, presence: true, length: { minimum: 3 }
end
