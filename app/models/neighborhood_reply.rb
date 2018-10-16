class NeighborhoodReply < ApplicationRecord
    belongs_to :user
    belongs_to :neighborhood_post
    has_many :neighborhood_reply_likes
end
