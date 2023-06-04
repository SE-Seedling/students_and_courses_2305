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

    all_students_with_scores.each do |student, scores|
      scores.each do |score|
        matching_students_grades << student if score < threshold
      end
    end

    matching_students_grades.uniq
  end

  def all_students_with_scores
    students = list_all_students.values.flatten
    students.to_h do |student|
      [student, student.scores]
    end
  end

  def all_grades
    course_grades_hash = {}

    list_all_students.each do |course, students|
      course_grades_hash[course] = students.map(&:scores).flatten
    end

    course_grades_hash
  end
end
