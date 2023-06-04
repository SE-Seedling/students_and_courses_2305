class Gradebook
  attr_reader :instructor, :courses

  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end
  
  def add_course(course_object)
    @courses << course_object
  end

  def list_all_students
    course_student_hash = {}

    @courses.each do |course|
      course_student_hash[course] = course.students
    end

    course_student_hash
  end

  def students_below(threshold)
    matching_students_grades = []

    list_all_students.each do |_, students|
      students.each do |student|
        student.scores.each do |score|
          if score < threshold
            matching_students_grades << student
          end
        end
      end
    end

    matching_students_grades.uniq
  end
end
