require 'rails_helper'

RSpec.describe Beer, type: :model do
  describe "with correct" do
    let(:test_brewery){ Brewery.new name:"test", year: 2000}
    let(:test_beer){ Beer.create name:"testbeer", style: "testbeer", brewery: test_brewery}

    it "name" do
      expect(test_beer.name).to eq("testbeer")
      expect(test_beer).to be_valid
      expect(Beer.count).to eq(1)
    end

    it "style" do
      expect(test_beer.style).to eq("testbeer")
      expect(test_beer).to be_valid
      expect(Beer.count).to eq(1)
    end

    it "brewery" do
      expect(test_beer.brewery).to eq(test_brewery)
      expect(test_beer).to be_valid
      expect(Beer.count).to eq(1)
    end
  end

  describe "without correct" do
    let(:test_brewery){ Brewery.new name:"test", year: 2000}
    let(:test_beer){ Beer.create name:"", style: "", brewery: nil}

    it "name" do
      expect(test_beer).not_to be_valid
      expect(Beer.count).to eq(0)
    end

    it "style" do
      expect(test_beer).not_to be_valid
      expect(Beer.count).to eq(0)
    end

    it "brewery" do
      expect(test_beer).not_to be_valid
      expect(Beer.count).to eq(0)
    end
  end

end
