class User < ApplicationRecord
  
  # Temporary attribute for form
  attr_accessor :town_name, :neighborhood_name

  # Active Records Association
  belongs_to :neighborhood, optional: true
  belongs_to :town, optional: true
  belongs_to :city, optional: true
  belongs_to :state, optional: true
  belongs_to :country, optional: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
