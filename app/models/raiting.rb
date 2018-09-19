class Raiting < ApplicationRecord
  belongs_to :beer
  belongs_to :user
  def to_s
    "#{beer.name} #{score}"
  end

end
