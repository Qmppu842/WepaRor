class User < ApplicationRecord
  include RaitingAverage

  has_many :raitings, dependent: :destroy
  has_many :beers, through: :raitings
  has_secure_password  
  has_many :memberships, dependent: :destroy
  has_many :beer_clubs, through: :memberships

  validates :username, uniqueness: true,
                       length: { minimum: 3, maximum: 60 }

  validates :password,
                    format: { with: /(?=.*[A-Z])(?=.*\d)[!-寃]{4,}/,
                    message: "must contain one capital letter and number" }
end
