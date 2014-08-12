require 'rails_helper'

describe 'user sessions' do
	context 'when not signed up' do
		it 'user can sign up' do
			visit '/restaurants'
			expect(page).to have_content 'Sign up'
			click_link('Sign up')
			fill_in 'user[email]', with: 'test@test.com'
			fill_in 'user[password]', with: 'password'
			fill_in 'user[password_confirmation]', with: 'password'
			click_button('Sign up')

			expect(page).to have_content 'Welcome! You have signed up successfully.'
		end
	end

	context 'when signed up but not signed in' do
		before(:each) do
			visit '/users/sign_up'
			fill_in 'user[email]', with: 'test@test.com'
			fill_in 'user[password]', with: 'password'
			fill_in 'user[password_confirmation]', with: 'password'
			click_button('Sign up')
			click_link('Sign out')
		end

		it 'user cannot add a restaurant' do
			visit '/restaurants'
			expect(page).not_to have_content 'Add a restaurant'
		end

		it 'user can sign in' do
			visit '/restaurants'
			click_link('Sign in')
			fill_in 'user[email]', with: 'test@test.com'
			fill_in 'user[password]', with: 'password'
			click_button('Sign in')
			expect(page).to have_content 'Signed in successfully'
		end
	end

	context 'when signed in' do
		before(:each) do
			visit '/users/sign_up'
			fill_in 'user[email]', with: 'test@test.com'
			fill_in 'user[password]', with: 'password'
			fill_in 'user[password_confirmation]', with: 'password'
			click_button('Sign up')
		end

		it 'user can sign out' do
			visit '/restaurants'
			click_link 'Sign out'
			expect(page).to have_content 'Sign in'
		end
	end

end