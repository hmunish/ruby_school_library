require_relative 'person'

class Teacher < Person
  def initialize(age, speacialization, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @speacialization = speacialization
  end

  def can_use_services?
    true
  end
end
