class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :profile
      t.string :description
      t.integer :salary
      t.string :location
      
      t.timestamps
    end
  end
end
