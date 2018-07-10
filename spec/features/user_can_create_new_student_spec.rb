require 'rails_helper'

describe 'user visits new student page' do
  it 'user can create a new student' do
    visit new_student_path

    fill_in 'student[name]', with: 'Jessica Jones'

    click_on "Create Student"

    expect(page).to have_content('Jessica Jones')
  end
end
