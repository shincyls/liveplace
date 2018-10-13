class State < ApplicationRecord
    # Active Records Association
    belongs_to :country
    has_many :cities
end
