class CreateNeighborhoodReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :neighborhood_replies do |t|
      t.string :reply
      t.string :image
      t.string :video_url
      t.timestamps
    end
  end
end
