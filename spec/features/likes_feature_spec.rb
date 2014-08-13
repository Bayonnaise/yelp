require 'rails_helper'

describe 'likes' do
	before (:each) do
		kfc = Restaurant.create(name: 'KFC', cuisine: 'Chicken')
		kfc.reviews.create(rating: 3, thoughts: 'It was alright')
	end

	it 'user can like a review', js:true do
		visit '/restaurants'
		expect(page).to have_content '0 likes'
		click_link('Like')
		expect(page).to have_content '1 like'
	end
end