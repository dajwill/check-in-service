class AddBusinessCodeToCheckIn < ActiveRecord::Migration
  def change
    add_column :check_ins, :business_code, :string
  end
end