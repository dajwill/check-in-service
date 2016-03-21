class AddCodeToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :code, :string
  end
end