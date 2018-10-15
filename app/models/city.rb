class City < ApplicationRecord
    # Active Records Association
    belongs_to :state
    has_many :towns
    has_many :users
end
