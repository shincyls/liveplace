class Country < ApplicationRecord
    # Active Records Association
    has_many :states
    has_many :users
end
