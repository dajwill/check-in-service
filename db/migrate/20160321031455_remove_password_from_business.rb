class RemovePasswordFromBusiness < ActiveRecord::Migration
  def change
    remove_column :businesses, :password, :string
  end
end