require 'rails_helper'

describe 'user visits student index page' do
  it 'user can delete a student' do
    student = Student.create(name: 'Bobby Jones')

    visit students_path

    click_on 'Delete'

    expect(current_path).to eq(students_path)
    expect(page).to_not have_content('Bobby Jones')
  end
end
