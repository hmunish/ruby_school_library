require './classes/classroom'
require './classes/student'

describe Classroom do
  context 'When testing Classroom class' do
    classroom = Classroom.new('TestLabel')

    it 'should create instance of classroom' do
      expect(classroom).to be_an_instance_of Classroom
    end

    it 'should return label of classroom instance' do
      expect(classroom.label).to eq 'TestLabel'
    end

    it 'should add student object to students array' do
      classroom.add_student(Student.new(25, 'Student1'))
      expect(classroom.students[0]).to be_an_instance_of Student
    end
  end
end
