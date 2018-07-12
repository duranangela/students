require 'rails_helper'

describe 'user visits new address page' do
  it 'user can create a new address' do
    student = Student.create(name: 'Mary Brown')
    description = 'Summer'
    street_address = '123 Main St.'
    city = 'Denver'
    state = 'CO'
    zip_code = 80002

    visit new_student_address_path(student)

    fill_in :address_description, with: description
    fill_in :address_street_address, with: street_address
    fill_in :address_city, with: city
    fill_in :address_state, with: state
    fill_in :address_zip_code, with: zip_code

    click_on 'Create Address'

    expect(current_path).to eq(student_path(student))
    expect(page).to have_content(description)
    expect(page).to have_content(street_address)
    expect(page).to have_content(city)
    expect(page).to have_content(state)
    expect(page).to have_content(zip_code)
  end
end
