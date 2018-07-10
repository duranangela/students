require 'rails_helper'

describe 'user visits new address page' do
  it 'user can create a new address' do
    student = Student.create(name: 'Mary Brown')

    visit new_student_address_path(student)

    fill_in 'address[description]', with: 'Summer'
    fill_in 'address[street_address]', with: '123 Main St.'
    fill_in 'address[city]', with: 'Denver'
    fill_in 'address[state]', with: 'CO'
    fill_in 'address[zip_code]', with: 80002

    click_on 'Create Address'

    expect(current_path).to eq(student_path(student))
    expect(page).to have_content('Summer')
    expect(page).to have_content('123 Main St.')
    expect(page).to have_content('Denver')
    expect(page).to have_content('CO')
    expect(page).to have_content(80002)
  end
end
