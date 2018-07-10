require 'rails_helper'

describe 'user visits student show page' do
  it 'displays name of one student' do
    student1 = Student.create(name: 'Bobby Jones')
    student2 = Student.create(name: 'Mary Brown')

    visit student_path(student1)

    expect(page).to have_content(student1.name)
    expect(page).to_not have_content(student2.name)
  end

  it 'displays addresses for one student' do
    student1 = Student.create(name: 'Bobby Jones')
    add1 = student1.addresses.create(description: 'Summer Address',
                              street_address: '123 Main St',
                              city: 'Denver',
                              state: 'CO',
                              zip_code: '80001')
    add2 = student1.addresses.create(description: 'School Address',
                              street_address: '456 State St',
                              city: 'Arvada',
                              state: 'CO',
                              zip_code: '80002')

    visit student_path(student1)

    expect(page).to have_content(add1.description)
    expect(page).to have_content(add1.street_address)
    expect(page).to have_content(add1.city)
    expect(page).to have_content(add1.state)
    expect(page).to have_content(add1.zip_code)
    expect(page).to have_content(add2.description)
    expect(page).to have_content(add2.street_address)
    expect(page).to have_content(add2.city)
    expect(page).to have_content(add2.state)
    expect(page).to have_content(add2.zip_code)
  end
end
