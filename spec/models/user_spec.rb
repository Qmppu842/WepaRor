require 'rails_helper'

RSpec.describe User, type: :model do
  it "has the username set correctly" do
    user = User.new username: "Pekka"

    expect(user.username).to eq("Pekka")
  end

  it "is not saved without a password" do
    user = User.create username:"Pekka"

    expect(user).not_to be_valid
    expect(User.count).to eq(0)
  end
  describe "with a proper password" do
    let(:user){ FactoryBot.create(:user) }
    let(:test_brewery){ FactoryBot.create(:brewery)}
    let(:test_beer){ FactoryBot.create(:beer)}

    it "is saved" do
      expect(user).to be_valid
      expect(User.count).to eq(1)
    end

  it " and two raitings, has the correct average raiting" do
    FactoryBot.create(:raiting, score: 10, user: user)
    FactoryBot.create(:raiting, score: 20, user: user)

    expect(user.raitings.count).to eq(2)
    expect(user.average_raiting).to eq(15)
    end
  end

  describe "is not saved" do
    let(:user){User.new username:"Pekka"}

    it "when password and password_confirmation does not match" do
      user.password = "Secret1"
      user.password_confirmation = "salakka"
      user.save

      expect(user).not_to be_valid
      expect(User.count).to eq(0)
    end
      it "when password is shorter than 4 characters" do
        user.password = "2DS"
        user.password_confirmation = "2DS"
        user.save

        expect(user).not_to be_valid
        expect(User.count).to eq(0)
      end
      it "when password has no capital letters " do
        user.password = "dsada2"
        user.password_confirmation = "dsada2"
        user.save

        expect(user).not_to be_valid
        expect(User.count).to eq(0)
      end
      it "when password has no numbers" do
        user.password = "Defence"
        user.password_confirmation = "Defence"
        user.save

        expect(user).not_to be_valid
        expect(User.count).to eq(0)

    end
  end

  # TDD things
  describe "favorite beer" do
    let(:user){ FactoryBot.create(:user) }

    it "has method for determining the favorite_beer" do
      expect(user).to respond_to(:favorite_beer)
    end

    it "without ratings does not have a favorite beer" do
      expect(user.favorite_beer).to eq(nil)
    end

    it "is the only rated if only one rating" do
      beer = FactoryBot.create(:beer)
      rating = FactoryBot.create(:raiting, score: 20,  beer: beer, user: user)

      expect(user.favorite_beer).to eq(beer)
    end
    it "is the one with highest rating if several rated" do
      create_beers_with_many_raitings({user: user}, 10, 20 ,15, 7, 9)
      best = create_beer_with_rating({user: user}, 25)

      expect(user.favorite_beer).to eq(best)
    end
  end
end

def create_beer_with_rating(object, score)
  beer = FactoryBot.create(:beer)
  FactoryBot.create(:raiting, beer: beer, score: score, user: object[:user])
  beer
end

def create_beers_with_many_raitings(object, *scores)
  scores.each do |score|
    create_beer_with_rating(object, score)
  end
end
