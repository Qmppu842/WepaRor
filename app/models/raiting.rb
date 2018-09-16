class Raiting < ApplicationRecord
  belongs_to :beer

  def to_s
    return "#{Beer.find_by( id: self.beer_id).name } #{self.score}"
  end

end
