class Brewery < ApplicationRecord
  include RaitingAverage

  has_many :beers, dependent: :destroy
  has_many :raitings, through: :beers

  validates :name, length: { minimum: 1 }
  validates :year, numericality: { greater_than_or_equal_to: 1040,
                                   less_than_or_equal_to: ->(_) { Time.now.year },
                                   only_integer: true }

  scope :active, ->{ where active: true }
  scope :retired, ->{ where active: [nil, false]}

  def print_report
    puts name
    puts "established at year #{year}"
    puts "number of beers #{beers.count}"
  end

  def restart
    self.year = 2018
    puts "changed year to #{year}"
  end

end
