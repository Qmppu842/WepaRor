class User < ApplicationRecord
  include RaitingAverage

  has_many :raitings, dependent: :destroy
  has_many :beers, through: :raitings
  has_secure_password
  has_many :memberships, dependent: :destroy
  has_many :beer_clubs, through: :memberships

  validates :username, uniqueness: true,
                       length: { minimum: 3 }

  validates :password,
            format: { with: /(?=.*[A-Z])(?=.*\d)[!-寃]{4,}/,
                      message: "must contain one capital letter and number" }

  scope :admins, -> {where admin: true}
  scope :normal, ->{where admin: [nil, false]}


  def favorite_beer
    return nil if raitings.empty?

    raitings.order(score: :desc).limit(1).first.beer
  end

  # Ymm typos are the best(est)
  def average_of(raitingss)
    raitingss.sum(&:score).to_f / raitingss.count
  end

  def favorite_style
    return nil if raitings.empty?

    style_ratings = raitings.group_by{ |r| r.beer.style }
    averages = style_ratings.map do |style, raitings|
      { style: style, score: average_of(raitings) }
    end

    averages.max_by{ |r| r[:score] }[:style]
  end

  def favorite_brewery
    return nil if raitings.empty?

    style_ratings = raitings.group_by{ |r| r.beer.brewery }
    averages = style_ratings.map do |brewery, raitings|
      { brewery: brewery, score: average_of(raitings) }
    end

    averages.max_by{ |r| r[:score] }[:brewery]
  end
end
