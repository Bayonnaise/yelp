require 'rails_helper'

describe 'likes' do
	before (:each) do
		kfc = Restaurant.create(name: 'KFC', cuisine: 'Chicken')
		kfc.reviews.create(rating: 3, thoughts: 'It was alright')

		@dave = User.create(email: 'dave@test.com', password: '12345678', password_confirmation: '12345678')
	end

	it 'user cannot like a review when not signed in' do
		visit '/restaurants'
		expect(page).not_to have_link 'Like'
	end

	it 'user can like a review when signed in', js:true do
		login_as @dave

		visit '/restaurants'
		expect(page).to have_content '0 likes'
		click_link('Like')
		expect(page).to have_content '1 like'
	end
end