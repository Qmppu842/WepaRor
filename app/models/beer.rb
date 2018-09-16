class Beer < ApplicationRecord
include RaitingAverage

  belongs_to :brewery
  has_many :raitings, dependent: :destroy

#  def avarage_raiting
#    a = 0.0
#    Raiting.where(beer_id: self.id).find_each do |koira|
#      a += koira.score
#      puts "aa #{koira.score}"
#    end
#    return (a)/  Raiting.where(beer_id: self.id).count
#  end

#  def avarage_raiting2
#    a = 0.0
#    Raiting.where(beer_id: self.id).map{|jotain| a += jotain.score}
#    return (a)/  Raiting.where(beer_id: self.id).count
#  end
#
#  def avarage_raiting3
#    a = 0.0
#    a= Raiting.where(beer_id: self.id).map{|jotain| jotain.score}.reduce(:+)
#    return (a)/  Raiting.where(beer_id: self.id).count
#  end

  #def avarage_raiting4
  #  return self.raitings.map{|jotain| jotain.score}.reduce(:+)/  self.raitings.count
  #end

def count_raitings
  return Raiting.where(beer_id: self.id).count
end

  def to_s
    return "#{self.name}, #{self.brewery.name}"
  end


end
