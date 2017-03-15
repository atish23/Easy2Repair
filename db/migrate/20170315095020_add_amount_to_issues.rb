class AddAmountToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :total_amount, :string
  end
end
