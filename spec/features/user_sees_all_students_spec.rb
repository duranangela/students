require 'rails_helper'

describe 'user sees all students' do
  it 'displays all student names' do
    student1 = Student.create(name: 'Bobby Jones')
    student2 = Student.create(name: 'Mary Brown')

    visit students_path

    expect(page).to have_content(student1.name)
    expect(page).to have_content(student2.name)
  end
  it 'links to individual student show pages' do
    student = Student.create(name: 'Bobby Jones')

    visit students_path

    click_on student.name

    expect(current_path).to eq(student_path(student))
    expect(page).to have_content(student.name)
  end

end
