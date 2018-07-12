require 'rails_helper'

describe 'user visits new student page' do
  it 'user can create a new student' do
    visit new_student_path

    fill_in 'student[name]', with: 'Jessica Jones'

    click_on "Create Student"

    expect(current_path).to eq(student_path(Student.last))
    expect(page).to have_content(Student.last.name)
  end
end
