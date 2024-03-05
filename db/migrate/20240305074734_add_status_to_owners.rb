class AddStatusToOwners < ActiveRecord::Migration[7.1]
  def change
    add_column :owners, :status, :string
  end
end
