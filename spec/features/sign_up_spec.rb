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
      expect(page).to have_css '.alert'
      expect(page).to have_css '.alert-success'
      expect(page).to have_content 'Usuario agregado satisfactoriamente'
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
    scenario 'Data is invalid' do
      visit '/auth/sign_up'
      within('form') do
        fill_in 'name', with: 'user'
        fill_in 'email', with: ''
        fill_in 'password', with: ''
      end
      click_button 'Crear'
      expect(page).to have_css '.alert'
      expect(page).to have_css '.alert-warning'
      expect(page).to have_content 'Error con los datos ingresados'
      expect(page).to have_css '.container'
      expect(page).to have_css '.form-group'
      expect(page).to have_content 'Nombre'
      expect(page).to have_field 'name'
      expect(page).to have_css '.form-control'
      expect(page).to have_css '.form-group'
      expect(page).to have_content 'Correo'
      expect(page).to have_css '.form-control'
      expect(page).to have_field 'email'
      expect(page).to have_css '.form-group'
      expect(page).to have_content 'Password'
      expect(page).to have_css '.form-control'
      expect(page).to have_field 'password'
      expect(page).to have_css '.btn'
      expect(page).to have_css '.btn-primary'
      expect(page).to have_button 'Crear'
    end
  end
end
