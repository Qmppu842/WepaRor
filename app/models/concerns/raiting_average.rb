module RaitingAverage
  extend ActiveSupport::Concern


  def average_raiting
    raitings.map{|jotain| jotain.score }.reduce(:+) / raitings.count.to_f
  end

end
