require 'rails_helper'

include Helpers

describe "User" do
  before :each do
    FactoryBot.create :user
  end

  describe "who has signed up" do
    it "can singin with right credentials" do
      sign_in(username: "Pekka", password: "Foobar1")

      expect(page).to have_content 'Welcome back!'
      expect(page).to have_content 'Pekka'
    end

    it "is redirected back to signin form if wrong credentials given" do
      sign_in(username: "Pekka", password: "wrong")

      expect(current_path).to eq(signin_path)
      expect(page).to have_content 'Username and/or password mismatch'
    end
  end

  it "when singed up with good credentials, is added to the system" do
    visit signup_path
    fill_in('user_username', with: 'Brian')
    fill_in('user_password', with: 'Secret55')
    fill_in('user_password_confirmation', with: 'Secret55')

    expect{
      click_button('Create User')
    }.to change{User.count}.by(1)
  end

  describe "making ratings" do
      let!(:user2){FactoryBot.create(:user, username:"Velma")}
      let!(:user1){FactoryBot.create(:user, username:"Vilma")}

      it "but just cheking empty situtiation" do
        sign_in(username: "Vilma", password: "Foobar1")
        visit user_path(user1)
        expect(page).to have_content("This user has given premission to sell their soul.")
      end

      it "and then changing account" do
        sign_in(username: "Vilma", password: "Foobar1")
        create_beers_with_many_ratings({user: user1}, 5, 20, 10, 5)
        visit user_path(user1)

        expect(page).to have_content("This user has given 4 raitings with average of 10")

        sign_in(username: "Velma", password: "Foobar1")
        visit user_path(user2)
        expect(page).to have_content("This user has given premission to sell their soul.")
      end

      it "and then changing account and making ratings again" do
        sign_in(username: "Vilma", password: "Foobar1")
        create_beers_with_many_ratings({user: user1}, 5, 20, 10, 5)
        visit user_path(user1)

        expect(page).to have_content("This user has given 4 raitings with average of 10")

        sign_in(username: "Velma", password: "Foobar1")
        create_beers_with_many_ratings({user: user2}, 15, 30, 20, 15)
        visit user_path(user2)
      expect(page).to have_content("This user has given 4 raitings with average of 20")
      end


  end


end
