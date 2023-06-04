class Course
    attr_reader :name, :capacity, :students

    def initialize(name, capacity)
        @name = name
        @capacity = capacity
        @students = []
    end

    def full?
        return true if @students.size == @capacity
        false
    end

    def enroll(student_object)
        @students << student_object
    end
end
