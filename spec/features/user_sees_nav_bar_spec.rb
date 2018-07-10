require 'rails_helper'

describe 'user visits student index page' do
  it 'user sees nav bar' do
    visit students_path

    expect(page).to have_selector(:link_or_button,'See All Students')
    expect(page).to have_selector(:link_or_button, 'Create New Student')
  end
end
