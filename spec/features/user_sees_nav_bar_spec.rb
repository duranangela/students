require 'rails_helper'

describe 'user visits any page' do
  it 'user sees nav bar on student index page' do
    visit students_path

    expect(page).to have_selector(:link_or_button,'See All Students')
    expect(page).to have_selector(:link_or_button, 'Create New Student')
  end
  it 'user sees nav bar on student show page' do
    student = Student.create(name: 'Bobby Brown')

    visit student_path(student)

    expect(page).to have_selector(:link_or_button,'See All Students')
    expect(page).to have_selector(:link_or_button, 'Create New Student')
  end
  it 'user click on link for index page' do
    student = Student.create(name: 'Bobby Brown')

    visit student_path(student)
    click_on('See All Students')

    expect(current_path).to eq(students_path)
  end
  it 'user click on link for index page' do

    visit students_path
    click_on('Create New Student')

    expect(current_path).to eq(new_student_path)
  end
end
