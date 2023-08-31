require_relative 'person'

class Student < Person
    def initialize(classroom)
        super(age, name)
        @classroorm = classroom
    end
    def play_hooky
        "¯\(ツ)/¯"
    end
end

