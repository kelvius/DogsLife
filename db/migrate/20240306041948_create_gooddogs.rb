class CreateGooddogs < ActiveRecord::Migration[7.1]
  def change
    create_table :gooddogs do |t|
      t.string :name
      t.integer :age
      t.string :favoritetreat
      t.references :breed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
