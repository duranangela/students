require 'rails_helper'

describe Course, type: :model do
  describe 'relationships' do
    it {should have_many(:student_courses)}
    it {should have_many(:students).through(:student_courses)}
  end
end
