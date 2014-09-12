require 'rails_helper'

describe 'reviewing restaurants' do

	before(:each) do
		dave = User.create(email: 'dave@test.com', password: '12345678', password_confirmation: '12345678')
		login_as dave
		Restaurant.create(name: 'McDonalds', cuisine: 'American')
	end

	it 'allows users to leave reviews using a form, and appear alongside restaurants' do
		visit '/restaurants'
		click_link 'Review McDonalds'
		fill_in 'Thoughts', :with => 'Not bad'
		select '3', :from => 'Rating'
		click_button 'Leave review'

		expect(current_path).to eq restaurants_path
		expect(page).to have_content '★★★☆☆ Not bad'
	end

	it 'displays the average rating of each restaurant' do
		restaurant = Restaurant.first
		restaurant.reviews.create(thoughts: 'Meh', rating: '2')
		restaurant.reviews.create(thoughts: 'Uh', rating: '4')
		visit '/restaurants'
		expect(page).to have_content 'McDonalds, American ★★★☆☆'
	end
end