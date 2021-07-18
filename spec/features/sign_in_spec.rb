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
      click_button 'Iniciar sesión'
      expect(page).to have_content 'Error al iniciar sesión'
      expect(page).to have_css '.alert'
      expect(page).to have_css '.alert-danger'
      expect(page).to have_css '.container'
      expect(page).to have_css '.form-group'
      expect(page).to have_content 'Correo'
      expect(page).to have_css '.form-control'
      expect(page).to have_field 'email'
      expect(page).to have_css '.form-group'
      expect(page).to have_content 'Password'
      expect(page).to have_css '.form-control'
      expect(page).to have_field 'password'
      expect(page).to have_css '.btn'
      expect(page).to have_css '.btn-success'
      expect(page).to have_button 'Iniciar sesión'
    end
  end
end
