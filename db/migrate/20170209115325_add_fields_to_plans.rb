class AddFieldsToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :desc2, :string
    add_column :plans, :desc3, :string
  end
end
