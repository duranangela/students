require 'rails_helper'

describe 'use sees all students' do
  it 'displays all student names' do
    student1 = Student.create(name: 'Bobby Jones')
    student2 = Student.create(name: 'Mary Brown')

    visit students_path

    expect(page).to have_content(student1.name)
    expect(page).to have_content(student2.name)
  end
end
