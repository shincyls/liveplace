class CreateNeighborhoodReplyLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :neighborhood_reply_likes do |t|
      t.references :user
      t.references :neighborhood_reply
      t.timestamps
    end
  end
end
