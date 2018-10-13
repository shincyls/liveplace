class Country < ApplicationRecord
    # Active Records Association
    has_many :states
end
