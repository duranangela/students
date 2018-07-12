require 'rails_helper'

describe 'user visits course show page' do
  it 'displays name of course and list of students for course' do
    course = Course.create(name: 'Maths')
    student1 = course.students.create(name: 'Bobby Jones')
    student2 = course.students.create(name: 'Mary Brown')

    visit course_path(course)

    expect(page).to have_content(course.name)
    expect(page).to have_content(student1.name)
    expect(page).to have_content(student2.name)
  end
end
