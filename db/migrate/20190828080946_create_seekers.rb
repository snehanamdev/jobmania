class CreateSeekers < ActiveRecord::Migration[5.2]
  def change
    create_table :seekers do |t|
      t.string :name
      t.integer :mobile	
      t.string :gender
      t.date :dob
      t.string :address

      t.timestamps
    end
  end
end
