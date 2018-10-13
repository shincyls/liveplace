class CreateNeighborhoods < ActiveRecord::Migration[5.2]
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.references :town
      t.string :address
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
