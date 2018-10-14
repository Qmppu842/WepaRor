module RaitingAverage
  extend ActiveSupport::Concern

  def average_raiting
    (raitings.map(&:score).reduce(:+)*1.0) / raitings.count
  end


  def count_and_plural_of_raitings
    counter = raitings.count
    plural = "raiting".pluralize(counter)
    " " + counter.to_s + " " + plural
  end
end
