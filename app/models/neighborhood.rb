class Neighborhood < ApplicationRecord
    # Active Records Association
    belongs_to :town
    has_many :users
end
