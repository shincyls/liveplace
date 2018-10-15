class CreateNeighborhoodPostLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :neighborhood_post_likes do |t|
      t.reference :user
      t.reference :neighborhood_post
      t.timestamps
    end
  end
end
