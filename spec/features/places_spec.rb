require 'rails_helper'

describe "Places" do
  it "if one is returned by the API, it is shown at the page" do
    allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
      [Place.new( name:"Oljenkorsi", id: 1)]
    )
    visit places_path
    fill_in('city', with:'kumpula')
    click_button "Search"
    #save_and_open_page
    expect(page).to have_content "Oljenkorsi"
  end

  it "if none is returned by the API, dont shown at the page" do
    kalala = "kalakala"
    no_place_in_city_from_beermapping(kalala)
    visit places_path

    fill_in('city', with:kalala)
    click_button "Search"
    expect(page).to have_content "No locations in #{kalala}"
  end

  it "if multiple is returned by the API, shown all of them at the page" do
    city = "kalakala"
    multiple_places_in_city_from_beermapping(city)
    visit places_path

    fill_in('city', with:city)
    click_button "Search"

    expect(page).to have_content "Oljenkorsi"
    expect(page).to have_content "Kello baari"
    expect(page).to have_content "Hopeatuoppi"
  end
end

def no_place_in_city_from_beermapping(city)
  allow(BeermappingApi).to receive(:places_in).with(city).and_return([])
end

def one_place_in_city_from_beermapping(city)
  allow(BeermappingApi).to receive(:places_in).with(city).and_return(
    [Place.new( name:"Oljenkorsi", id: 1)]
  )
end
# This probaly could be done in more "specy" way with loop but this will do for now
def multiple_places_in_city_from_beermapping(city)
  allow(BeermappingApi).to receive(:places_in).with(city).and_return(
    [ Place.new( name:"Oljenkorsi", id: 1),
      Place.new( name:"Kello baari", id: 2),
      Place.new( name:"Hopeatuoppi", id: 3)]
  )
end
