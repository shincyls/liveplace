class CreateNeighborhoodPostLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :neighborhood_post_likes do |t|
      t.references :user
      t.references :neighborhood_post
      t.timestamps
    end
  end
end
