class User < ApplicationRecord
  include RaitingAverage

  has_many :raitings

  validates :username, uniqueness: true,
                       length: { minimum:  3 }
end
