class AddFieldsToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :status, :string
  end
end
