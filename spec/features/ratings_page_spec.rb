require 'rails_helper'

include Helpers

describe "Rating" do
  let!(:brewery){ FactoryBot.create :brewery, name:"Koff"}
  let!(:beer1){FactoryBot.create :beer, name:"Iso 3", brewery:brewery}
  let!(:beer2){FactoryBot.create :beer, name:"Karhu", brewery:brewery}
  let!(:user){FactoryBot.create :user}

  before :each do
    sign_in(username:"Pekka", password:"Foobar1")
  end

  it "when given, is registered to the beer and user who is signed in" do
    visit new_raiting_path
    select('Iso 3', from: 'raiting[beer_id]')
    fill_in('raiting[score]', with: 15)

    expect{
      click_button "Create Raiting"
    }.to change{Raiting.count}.from(0).to(1)

    expect(user.raitings.count).to eq(1)
    expect(beer1.raitings.count).to eq(1)
    expect(beer1.average_raiting).to eq(15)
  end

  it "when there is no ratings" do
    visit raitings_path
    #save_and_open_page
    expect(Raiting.count).to eq(0)
    expect(page).to have_content "Total Amount of raitings 0"
  end

  it "when there is one rating" do
    create_beer_with_rating({user: user}, 20)
    visit raitings_path

    expect(Raiting.count).to eq(1)
    expect(page).to have_content "Total Amount of raitings"
  end

  it "when there is many ratings" do
    create_beers_with_many_ratings({user: user}, 20,30,9,8,2,3,49)
    visit raitings_path


    expect(Raiting.count).to eq(7)
    expect(page).to have_content "Total Amount of raitings #{7}"
  end



#  it "when user removes a rating, it is deleted from database" do
#  sign_in( username: 'Pekka', password: 'Foobar1')
#  visit user_path(user)
#  create_beer_with_rating({ user: user, style: 'Pale Ale' }, 20)

  # etsitään sivun kaikista linkeistä ensimmäinen jonka teksti on delete
#  delete_link = all('a').select{ |l| l.text=='delete' }.first
#    create_beer_with_rating({ user: user, style: 'Pale Ale' }, 26)
#  save_and_open_page
#  expect{
#    delete_link.click
#  }.to change{Raiting.count}.by(-1)
#end
end
