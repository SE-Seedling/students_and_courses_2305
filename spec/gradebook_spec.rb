require 'rspec'
require './lib/course'
require './lib/student'
require './lib/gradebook'

RSpec.describe Gradebook do
  subject { Gradebook.new('Mr. Professor') }
  let(:course1) { Course.new("Calculus", 2) }
  let(:course2) { Course.new("Herbology", 3) }
  let(:course3) { Course.new("Spanish", 5) }
  let(:student1) { Student.new({name: "Morgan", age: 21}) }
  let(:student2) { Student.new({name: "Jordan", age: 29}) }
  let(:student3) { Student.new({name: "Potter", age: 19}) }
  let(:student4) { Student.new({name: "Eren", age: 22}) }

  it 'has attributes' do
    expect(subject).to have_attributes(instructor: 'Mr. Professor', courses: [])
  end

  describe '#add_course' do
    it 'adds course object to gradebook' do
      subject.add_course(course2)
      expect(subject.courses).to match_array([course2])
    end
  end

  describe '#list_all_students' do
    let(:returned_hash) { {
      course1 => [student4],
      course2 => [student2, student3, student1],
      course3 => []
    } }

    it 'return hash of course objects with its students' do
      subject.add_course(course1)
      subject.add_course(course2)
      subject.add_course(course3)
      # if the students are not enrolled in the same order as in the
      # expected returned hash, spec will fail
      course1.enroll(student4)
      course2.enroll(student2)
      course2.enroll(student3)
      course2.enroll(student1)
      expect(subject.list_all_students).to eq(returned_hash)
    end
  end

  describe '#students_below threshold' do
    it 'returns array of students' do
      subject.add_course(course1)
      subject.add_course(course2)
      subject.add_course(course3)
      course2.enroll(student2)
      course2.enroll(student3)
      course2.enroll(student1)
      # I want to make sure that a student with a grade above the threshold
      # and another grade below it will be returned
      student1.log_score(90)
      student1.log_score(45)
      student3.log_score(60)
      student3.log_score(70)
      student2.log_score(95)
      expect(subject.students_below(75)).to match_array([student3, student1])
    end
  end
end
