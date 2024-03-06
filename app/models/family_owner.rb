class FamilyOwner < ApplicationRecord
  has_many :family_owner_joins
  has_many :persons, through: :family_owner_joins
  has_many :gooddogs, through: :family_owner_joins
end
