module RaitingAverage
  extend ActiveSupport::Concern

  def average_raiting
    raitings.map(&:score).reduce(:+) / raitings.count
  end

end
