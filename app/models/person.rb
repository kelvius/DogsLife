class Person < ApplicationRecord
  has_many :family_owner_joins
  has_many :family_owners, through: :family_owner_joins
end
