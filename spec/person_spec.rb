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

    it 'should return correct name of person' do
      expect(person.correct_name).to eq 'Jimmy'
    end

    it 'should return all instances of Person' do
      expect(Person.all[1]).to be_an_instance_of Person
    end
  end
end
