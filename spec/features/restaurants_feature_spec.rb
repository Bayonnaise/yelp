require 'rails_helper'

describe 'restaurants' do

	before(:each) do
		dave = User.create(email: 'dave@test.com', password: '12345678', password_confirmation: '12345678')
		login_as dave
	end

	context 'no restaurants have been added' do
		it 'should display a prompt to add a restaurant' do
			visit '/restaurants'
			expect(page).to have_content 'No restaurants'
			expect(page).to have_content 'Add a restaurant'
		end
	end

	context 'restaurants have been added' do
		before(:each) do
			Restaurant.create(name: 'McDonalds', cuisine: 'American')
		end

		it 'should display them' do
			visit '/restaurants'
			expect(page).to have_content 'McDonalds, American'
		end

		it 'should display a prompt to add a review' do
			visit '/restaurants'
			expect(page).to have_content "Review McDonalds"
		end
	end

	context 'adding restaurants' do
		it 'user can add a restaurant and see it displayed' do
			visit '/restaurants'
			click_link('Add a restaurant')
			fill_in 'Name', :with => 'Pizza Express'
			fill_in 'Cuisine', :with => 'Italian'
			click_button 'Create Restaurant'
			expect(page).to have_content 'Pizza Express, Italian'
			expect(current_path).to eq restaurants_path
		end

		it 'user cannot add a restaurant without a name or cuisine' do
			visit '/restaurants/new'
			click_button 'Create Restaurant'
			expect(page).to have_content 'errors'
		end
	end

	context 'modifying restaurants' do
		before(:each) do
			Restaurant.create(name: 'KFC', cuisine: 'American')
		end

		it 'user can edit an existing restaurant' do
			visit '/restaurants'
			click_link('Edit KFC')
			fill_in 'Name', :with => 'Pizza Express'
			fill_in 'Cuisine', :with => 'Italian'
			click_button 'Update Restaurant'
			expect(page).to have_content 'Pizza Express, Italian'
			expect(page).to have_content 'Restaurant updated successfully'
		end

		it 'user cannot edit a restaurant without a name or cuisine' do
			visit '/restaurants'
			click_link('Edit KFC')
			fill_in 'Name', :with => ''
			fill_in 'Cuisine', :with => ''
			click_button 'Update Restaurant'
			expect(page).to have_content 'errors'
		end

		it 'user can delete an existing restaurant' do
			visit '/restaurants'
			click_link('Delete KFC')
			expect(page).not_to have_content 'KFC, American'
			expect(page).to have_content 'Restaurant deleted successfully'
		end
	end
	
end