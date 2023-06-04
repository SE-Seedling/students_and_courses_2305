require 'rspec'
require './lib/course'
require './lib/student'

RSpec.describe Course do 
    subject { Course.new("Calculus", 2) }

    it 'has attributes' do
        expect(subject).to have_attributes(name: 'Calculus', capacity: 2, students: [])
    end

    describe '#full?' do
         let(:student1) { Student.new({name: "Morgan", age: 21}) }
         let(:student2) { Student.new({name: "Jordan", age: 29}) }

        it 'returns false when initialized' do
            expect(subject.full?).to be_falsey
        end

        describe '#enroll' do
            it 'adds students to course' do
                subject.enroll(student1)
                subject.enroll(student2)
                expect(subject.students).to match_array([student1, student2])

                expect(subject.full?).to be_truthy
            end
        end
    end
end