# frozen_string_literal: true

require 'spec_helper'

RSpec.feature 'the sign in process', type: :feature do
  context 'Signing in with a created user previously' do
    before :each do
      User.create(name: 'user', email: 'user@example.com', password: 'password')
    end
    scenario 'Signing in with correct credentials' do
      visit '/auth/sign_in'
      within('form') do
        fill_in 'email', with: 'user@example.com'
        fill_in 'password', with: 'password'
      end
      click_button 'Iniciar sesión'
      expect(page).to have_content 'Has iniciado sesión user'
      expect(page).to have_content 'Hi User'
      expect(page).to have_content 'Welcome'
      expect(page).to have_content 'Your email is user@example.com'
    end
    scenario 'Signing in with incorrect credentials' do
      visit '/auth/sign_in'
      within('form') do
        fill_in 'email', with: 'user@example.com'
        fill_in 'password', with: 'pass'
      end
      expect(page).to have_content 'Correo'
      expect(page).to have_content 'Password'
      expect(page).to have_content 'Iniciar sesión'
    end
  end
end
