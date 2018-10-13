class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.string :name
      t.string :code
      t.references :country
      t.string :address
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
