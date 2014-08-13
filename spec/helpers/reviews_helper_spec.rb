RSpec.describe ReviewsHelper, :tpe => :helper do
	describe '#star_rating' do
		it 'returns N/A when no ratings' do
			expect(star_rating('N/A')).to eq 'N/A'
		end

		it 'returns 5 black stars when rating is 5' do
			expect(star_rating(5)).to eq '★★★★★'
		end

		it 'returns 3 black stars and 2 white stars when rating is 3' do
			expect(star_rating(3)).to eq '★★★☆☆'
		end

		it 'returns 3 black stars and 2 white stars when rating is 2.5' do
			expect(star_rating(2.5)).to eq '★★★☆☆'
		end
	end
end