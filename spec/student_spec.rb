require 'rspec'
require './lib/student'

RSpec.describe Student do
    subject { Student.new({name: "Morgan", age: 21}) }

    it 'has attributes' do
        expect(subject).to have_attributes(:name => 'Morgan', :age => 21)
    end

    describe '#scores' do
        it 'initializes with empty scores' do
            expect(subject.scores).to be_an(Array)
        end
    end

    describe '#log_score' do
        it 'adds scores for student' do
            subject.log_score(89)
            subject.log_score(78)
            expect(subject.scores).to match_array([89,78])
        end
    end

    describe '#grade' do
        it 'return the average grade' do
            subject.log_score(89)
            subject.log_score(78)
            expect(subject.grade).to eq(83.5)
        end
    end
end
