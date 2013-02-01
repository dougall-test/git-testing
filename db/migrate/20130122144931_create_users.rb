class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :value
      t.integer :affinity
      t.string :category
      t.datetime :release_date

      t.timestamps
    end
  end
end
