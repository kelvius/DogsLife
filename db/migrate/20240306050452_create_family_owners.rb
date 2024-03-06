class CreateFamilyOwners < ActiveRecord::Migration[7.1]
  def change
    create_table :family_owners do |t|
      t.string :surname

      t.timestamps
    end
  end
end
