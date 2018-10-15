class Town < ApplicationRecord
    # Active Records Association
    belongs_to :city
    has_many :neighborhoods
    has_many :users
end
