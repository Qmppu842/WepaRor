class Beer < ApplicationRecord
  belongs_to :brewery
  has_many :raitings

  def avarage_raiting
    a = 0
    Raiting.where(beer_id: self.id).find_each do |koira|
      a += koira.score
      puts "aa #{koira.score}"
    end
    return (a)/  Raiting.where(beer_id: self.id).count
  end



def count_raitings
  return Raiting.where(beer_id: self.id).count
end


end
