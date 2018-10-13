class City < ApplicationRecord
    # Active Records Association
    belongs_to :state
    has_many :towns
end
