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
    let(:user){User.create username:"Pekka", password:"Secret1", password_confirmation:"Secret1"}
    let(:test_brewery){ Brewery.new name:"test", year: 2000}
    let(:test_beer){ Beer.create name:"testbeer", style: "testbeer", brewery: test_brewery}

    it "is saved" do
      expect(user).to be_valid
      expect(User.count).to eq(1)
    end

  it " and two raitings, has the correct average raiting" do
    rating = Raiting.new score:10, beer: test_beer
    rating2 = Raiting.new score: 20, beer: test_beer

    user.raitings << rating
    user.raitings << rating2

    expect(user.raitings.count).to eq(2)
    expect(user.average_raiting).to eq(15)
    end
  end

  describe "with password problem is not saved" do
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
end
