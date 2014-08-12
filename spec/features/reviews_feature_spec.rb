require 'rails_helper'

describe 'reviewing restaurants' do

	before(:each) do
		visit '/users/sign_up'
		fill_in 'user[email]', with: 'test@test.com'
		fill_in 'user[password]', with: 'password'
		fill_in 'user[password_confirmation]', with: 'password'
		click_button('Sign up')
	end

	before(:each) do
		Restaurant.create(name: 'McDonalds', cuisine: 'American')
	end

	it 'allows users to leave reviews using a form, and appear alongside restaurants' do
		visit '/restaurants'
		click_link 'Review McDonalds'
		fill_in 'Thoughts', :with => 'Not bad'
		select '3', :from => 'Rating'
		click_button 'Leave review'

		expect(current_path).to eq restaurants_path
		expect(page).to have_content 'Not bad (3)'
	end

	it 'displays the average rating of each restaurant' do
		restaurant = Restaurant.first
		restaurant.reviews.create(thoughts: 'Meh', rating: '3')
		restaurant.reviews.create(thoughts: 'Uh', rating: '5')
		restaurant.reviews.create(thoughts: 'What?', rating: '2')
		visit '/restaurants'
		expect(page).to have_content 'Average rating: 3.3'
	end
end