class User < ApplicationRecord
  has_many :raitings
  include RaitingAverage
end
