class CreateFamilyOwnerJoins < ActiveRecord::Migration[7.1]
  def change
    create_table :family_owner_joins do |t|
      t.references :family_owner, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.references :gooddog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
