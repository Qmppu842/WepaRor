class Raiting < ApplicationRecord
  belongs_to :beer

  def to_s
      #Raiting.all.select{ |r| r.beer.nil? }.each{ |r| r.delete }
    #  raise
  #    if Raiting.find_by( beer_id: self.beer_id) == nil
  #      self.delete
  #      self.destroy
  #    end

    return "#{Beer.find_by( id: self.beer_id).name } #{self.score}"
  end

end
