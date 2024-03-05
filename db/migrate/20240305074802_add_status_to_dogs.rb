class AddStatusToDogs < ActiveRecord::Migration[7.1]
  def change
    add_column :dogs, :status, :string
  end
end
