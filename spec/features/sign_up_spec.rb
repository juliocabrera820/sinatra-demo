# frozen_string_literal: true

require 'spec_helper'

RSpec.feature 'the sign up process', type: :feature do
  context 'Filling in sign up form' do
    scenario 'Data is valid' do
      visit '/auth/sign_up'
      within('form') do
        fill_in 'name', with: 'user'
        fill_in 'email', with: 'user@example.com'
        fill_in 'password', with: 'password'
      end
      click_button 'Crear'
      expect(page).to have_content 'Usuario agregado satisfactoriamente'
      expect(page).to have_content 'Correo'
      expect(page).to have_content 'Password'
      expect(page).to have_content 'Iniciar sesión'
    end
    scenario 'Data is invalid' do
      visit '/auth/sign_up'
      within('form') do
        fill_in 'name', with: 'user'
        fill_in 'email', with: ''
        fill_in 'password', with: ''
      end
      click_button 'Crear'
      expect(page).to have_content 'Error con los datos ingresados'
      expect(page).to have_content 'Nombre'
      expect(page).to have_content 'Correo'
      expect(page).to have_content 'Password'
    end
  end
end
