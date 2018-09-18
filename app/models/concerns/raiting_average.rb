module RaitingAverage
  extend ActiveSupport::Concern


  def average_raiting
    raitings.map{ @beer.score}.reduce(:+) / raitings.count.to_f
  end

end
