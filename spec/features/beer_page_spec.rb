require 'rails_helper'

include Helpers

describe "Beer" do
  let!(:brewery){ FactoryBot.create :brewery}
  let!(:brewery2){ FactoryBot.create :brewery, name: "Kirahvi"}
  let!(:user){FactoryBot.create :user}

  before :each do
    sign_in(username:"Pekka", password:"Foobar1")
  end

  it "can be added with valid data" do
    visit new_beer_path

    fill_in('beer_name', with:'Expresso')
    select('Lager', from: 'beer[style]')
    select('Kirahvi', from: 'beer[brewery_id]')

    expect{
      click_button("Create Beer")
    }.to change{Beer.count}.from(0).to(1)
  end

  it "cant be added with invalid data" do
    visit new_beer_path

    #fill_in('beer_name', with:'')
    select('Lager', from: 'beer[style]')
    select('Kirahvi', from: 'beer[brewery_id]')

    expect(Beer.count).to eq(0)
  end



end
