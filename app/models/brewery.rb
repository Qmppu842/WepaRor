class Brewery < ApplicationRecord
  has_many :beers, dependent: :destroy
  has_many :raitings, through: :beers

  def print_report
    puts name
    puts "established at year #{year}"
    puts "number of beers #{beers.count}"
  end

  def restart
    self.year = 2018
    puts "changed year to #{year}"
  end

  def average_raiting
    self.raitings.map{|jotain| jotain.score}.reduce(:+) / self.raitings.count
  end
end
