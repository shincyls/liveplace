class Neighborhood < ApplicationRecord
    # Active Records Association
    belongs_to :town
    has_many :users
    has_many :neighborhood_posts
end
