class Beer < ApplicationRecord
include RaitingAverage

  belongs_to :brewery
  has_many :raitings, dependent: :destroy

  def count_raitings
    Raiting.where(beer_id: self.id).count
  end

  def to_s
    "#{self.name}, #{brewery.name}"
  end

  def average
    return 0 if raitings.empty?
    raitings.map{ &:score }.sum / raitings.count.to_s
  end
end
