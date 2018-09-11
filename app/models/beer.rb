class Beer < ApplicationRecord
  belongs_to :brewery
  has_many :raitings
end
