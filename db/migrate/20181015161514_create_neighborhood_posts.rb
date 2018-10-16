class CreateNeighborhoodPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :neighborhood_posts do |t|
      t.references :user
      t.references :neighborhood
      t.string :post
      t.string :image
      t.string :video_url
      t.timestamps
    end
  end
end
