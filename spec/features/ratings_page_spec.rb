require 'rails_helper'

describe "Rating" do
  let!(:brewery){ FactoryBot.create :brewery, name:"Koff"}
  let!(:beer1){FactoryBot.create :beer, name:"Iso 3", brewery:brewery}
  let!(:beer2){FactoryBot.create :beer, name:"Karhu", brewery:brewery}
  let!(:user){FactoryBot.create :user}

  before :each do
    visit signin_path
    fill_in('username', with: 'Pekka')
    fill_in('password', with: 'Foobar1')
    click_button('Log in')
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
end
