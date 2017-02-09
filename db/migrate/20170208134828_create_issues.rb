class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :device
      t.text :desc
      t.references :user, index: true
      t.string :type_of_problem
      t.string :delivery

      t.timestamps
    end
  end
end
