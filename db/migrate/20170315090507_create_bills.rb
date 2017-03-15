class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :amount
      t.string :tax
      t.string :total
      t.references :issue, index: true

      t.timestamps
    end
  end
end
