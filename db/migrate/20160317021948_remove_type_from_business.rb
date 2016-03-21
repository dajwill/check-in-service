class RemoveTypeFromBusiness < ActiveRecord::Migration
  def change
    remove_column :businesses, :type, :string
  end
end