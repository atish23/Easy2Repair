class AddDescriptionToBills < ActiveRecord::Migration
  def change
    add_column :bills, :description, :string
  end
end
