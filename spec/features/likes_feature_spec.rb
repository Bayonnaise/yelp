require 'rails_helper'

describe 'likes' do
	before (:each) do
		kfc = Restaurant.create(name: 'KFC', cuisine: 'Chicken')
		kfc.reviews.create(rating: 3, thoughts: 'It was alright')
	end

	it 'user cannot like a review when not signed in' do
		visit '/restaurants'
		expect(page).not_to have_link 'Like'
	end

	it 'user can like a review when signed in', js:true do
		visit '/users/sign_up'
		fill_in 'user[email]', with: 'test@test.com'
		fill_in 'user[password]', with: 'password'
		fill_in 'user[password_confirmation]', with: 'password'
		click_button('Sign up')

		visit '/restaurants'
		expect(page).to have_content '0 likes'
		click_link('Like')
		expect(page).to have_content '1 like'
	end
end