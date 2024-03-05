class Dog < ApplicationRecord
include Visible

  belongs_to :owner
end
