class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.integer :business_id
      t.integer :visit_count
      t.string :offer

      t.timestamps
    end
  end
end