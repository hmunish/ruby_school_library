require_relative 'person'

class Teacher < Person
    def initialize(speacialization)
        super(age, name)
        @speacialization = speacialization
    end

    def can_use_services?
        true
    end
end