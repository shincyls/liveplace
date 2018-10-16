class NeighborhoodPostLike < ApplicationRecord
    belongs_to :user
    belongs_to :neighborhood_post
end
