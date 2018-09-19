class User < ApplicationRecord
  include RaitingAverage

  has_many :raitings
  has_many :beers, through: :raitings
  has_secure_password

  validates :username, uniqueness: true,
                       length: { minimum:  3, maximum: 60}

  # I did not come up totally with such regex.
  # My regex looked like this at end: [\S*([A-Z]|[{-寃])\S*]{4,}
  # But I spend over 1 hour trying to realise how I can meet minimum requirements
  # and allow numbers before and after Capitals with still needing only one digit
  # then I googled and found positive lookahead but could not quite grasp how those could allow such complex regex
  # Thou I knew that lookahead was in consept level what I need
  # + Now it allows to use pretty much any UTF-8 characters, I mean some businesess like Microsoft is not having that good character coverage
  validates :password, format: { with: /(?=.*[A-Z])(?=.*\d)[!-寃]{4,}/ }
end
