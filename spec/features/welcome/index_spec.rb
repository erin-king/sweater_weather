require 'rails_helper'

describe 'Welcome Index' do
  describe 'As a visitor' do
    it 'I can see a welcome page' do
      visit '/'
      expect(current_path).to eq('/')
      expect(page).to have_content('Welcome to SweaterWeather!')
    end
  end
end
