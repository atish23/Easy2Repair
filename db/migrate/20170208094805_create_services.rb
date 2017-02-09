class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :short_desc
      t.text :long_desc

      t.timestamps
    end
  end
end
