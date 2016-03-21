class AddBusinessTypeToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :business_type, :string
  end
end