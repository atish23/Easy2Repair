class AddPaymentToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :payment, :boolean, default: false
  end
end
