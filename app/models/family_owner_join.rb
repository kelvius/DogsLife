class FamilyOwnerJoin < ApplicationRecord
  belongs_to :family_owner
  belongs_to :person
  belongs_to :gooddog
end
