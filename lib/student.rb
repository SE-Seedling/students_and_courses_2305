class Student
    attr_reader :name, :age, :scores

    def initialize(personal_info)
        @name = personal_info[:name]
        @age = personal_info[:age]
        @scores = []
    end

    def log_score(score)
        @scores.push(score)
    end

    def grade
        @scores.sum(0.0) / @scores.size
    end
end
