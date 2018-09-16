class Beer < ApplicationRecord
include RaitingAverage

  belongs_to :brewery
  has_many :raitings, dependent: :destroy

def count_raitings
  return Raiting.where(beer_id: self.id).count
end

  def to_s
    return "#{self.name}, #{self.brewery.name}"
  end


end
