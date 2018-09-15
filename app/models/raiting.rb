class Raiting < ApplicationRecord
  belongs_to :beer

  def to_s
    return "#{Beer.name } #{self.score}"
  end

end
