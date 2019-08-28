class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :mobile
      t.string :address
      t.string :url

      t.timestamps
    end
  end
end
