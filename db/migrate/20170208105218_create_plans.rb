class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.string :type_plan
      t.integer :amount
      t.text :desc

      t.timestamps
    end
  end
end
