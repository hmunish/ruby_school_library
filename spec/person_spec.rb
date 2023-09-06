require './classes/person'

describe Person do
  context 'When testing Person class' do
    person = Person.new(25, 'Jimmy')

    it 'should create instance of Person' do
      expect(person).to be_an_instance_of Person
    end

    it 'should return name of person instance' do
      expect(person.name).to eq 'Jimmy'
    end

    it 'should return true' do
      expect(person.can_use_services?).to be true
    end
  end
end
