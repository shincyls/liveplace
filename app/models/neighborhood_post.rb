class NeighborhoodPost < ApplicationRecord
    belongs_to :user
    belongs_to :neighborhood
    has_many :neighborhood_replies
    has_many :neighborhood_post_likes
end
