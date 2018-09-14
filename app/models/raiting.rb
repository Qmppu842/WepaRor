class Raiting < ApplicationRecord
  belongs_to :beer

  def to_s
    begin
      return "#{Beer.find_by( id: self.beer_id).name } #{self.score}"
    rescue NoMethodError
      self.destroy
    end
    self.to_s
  end
end
