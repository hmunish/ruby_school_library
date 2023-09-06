require './classes/student'
require './classes/classroom'

describe Student do
  context 'When testing Student class' do
    student = Student.new(25, 'Jimmy')

    it 'should create instance of Student' do
      expect(student).to be_an_instance_of Student
    end

    it 'should return name of Student instance' do
      expect(student.name).to eq 'Jimmy'
    end

    it 'should return true' do
      expect(student.play_hooky).to eq '¯(ツ)/¯'
    end

    it 'should add classrom' do
      new_classroom = Classroom.new('test_classroom')
      student.classroom = new_classroom
      expect(student.classroom).to be new_classroom
    end
  end
end
