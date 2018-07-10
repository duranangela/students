require 'rails_helper'

describe 'user visits edit student page' do
  it 'user can edit a student name' do
    student = Student.create(name: 'Mary Brown')

    visit edit_student_path(student)

    fill_in 'student[name]', with: 'MaryAnne Brown'

    click_on 'Edit Student'

    expect(current_path).to eq(student_path(student))
    expect(page).to have_content('MaryAnne Brown')
  end
end
