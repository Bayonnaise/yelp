require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
	context 'validating restaurant fields' do
		it 'cannot save a restaurant without a name' do
			restaurant = Restaurant.new(name: '', cuisine: 'Test')
		  expect(restaurant).to have(1).error_on(:name)
		end

		it 'cannot save a restaurant without a cuisine' do
		  restaurant = Restaurant.new(name: 'Test', cuisine: '')
		  expect(restaurant).to have(1).error_on(:cuisine)
		end

		it 'can save a restaurant with a name and a cuisine' do
			restaurant = Restaurant.new(name: 'Test', cuisine: 'Test')
			expect(restaurant).to have(0).errors
		end
	end

	context 'checking dependencies' do
		it 'deleting a restaurant also deletes its reviews' do
			restaurant = Restaurant.create(name: 'test', cuisine: 'test')
			restaurant.reviews.create(rating: '3')
			expect(Review.count).to eq 1
			restaurant.destroy
			expect(Review.count).to eq 0
		end
	end
end
