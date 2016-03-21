class AddPasswordToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :password, :string
  end
end