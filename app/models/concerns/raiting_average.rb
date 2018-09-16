module RaitingAverage
  extend ActiveSupport::Concern


  def average_raiting
      self.raitings.map{|jotain| jotain.score}.reduce(:+) / self.raitings.count
  end

end
