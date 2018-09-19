class Beer < ApplicationRecord
  include RaitingAverage

  belongs_to :brewery
  has_many :raitings, dependent: :destroy

  validates :name, length: { minimum: 1}

  def count_raitings
    Raiting.where(beer_id: id).count
  end

  def to_s
    "#{name}, #{brewery.name}"
  end

  def average
    return 0 if raitings.empty?

    raitings.map{ :score }.sum / raitings.count.to_s
  end
end
