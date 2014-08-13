require 'rails_helper'

RSpec.describe Review, :type => :model do
	context 'validating review fields' do
		it 'is valid with a rating between 1 and 5' do
			review = Review.new(rating: '3')
			expect(review).to have(0).errors_on(:rating)
		end

	  it 'is invalid with a rating > 5' do
	  	review = Review.new(rating: '6')
	  	expect(review).to have(1).error_on(:rating)
	  end

	  it 'is invalid with a rating < 1' do
	  	review = Review.new(rating: '0')
	  	expect(review).to have(1).error_on(:rating)
	  end
	end

end
