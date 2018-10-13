class CreateTowns < ActiveRecord::Migration[5.2]
  def change
    create_table :towns do |t|
      t.string :name
      t.references :city
      t.string :postcode
      t.string :address
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
