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

	describe '#average_rating' do
		let(:restaurant) {Restaurant.create(name: 'Nandos', cuisine: 'chicken')}

		context 'has no reviews/ratings' do
			it 'returns N/A' do
				expect(restaurant.average_rating).to eq 'N/A'
			end
		end

		context 'has 1 review' do
			it 'returns that rating' do
				restaurant.reviews.create(rating: 4)
				expect(restaurant.average_rating).to eq 4
			end
		end

		context 'has multiple reviews' do
			it 'returns the average of all ratings' do
				restaurant.reviews.create(rating: 3)
				restaurant.reviews.create(rating: 5)
				expect(restaurant.average_rating).to eq 4
			end

			it 'returns a float if average is a non-whole number' do
				restaurant.reviews.create(rating: 4)
				restaurant.reviews.create(rating: 5)
				expect(restaurant.average_rating).to eq 4.5
			end
		end


	end
end
