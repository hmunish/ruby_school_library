require './classes/base_decorator'
require './classes/capitalize_decorator'
require './classes/trimmer_decorator'

describe Nameable do
  before :each do
    @nameable = Nameable.new
  end

  context 'When testing a Nameable class' do
    it 'should be an instance of Nameable' do
      expect(@nameable).to be_an_instance_of Nameable
    end
  end

  context 'When using correct_name method' do
    it 'should raise an error' do
      expect { @nameable.correct_name }.to raise_error('NotImplementedError')
    end
  end
end

describe BaseDecorator do
  context 'When testing BaseDecorator class' do
    base_decorator = BaseDecorator.new('Jimmy')
    it 'should create instance of base_decorator' do
      expect(base_decorator).to be_an_instance_of BaseDecorator
    end
  end
end
describe CapitalizeDecorator do
  context 'When testing CapitalizeDecorator class' do
    capitalize_decorator = CapitalizeDecorator.new('Jimmy')
    it 'should create instance of capitalize_decorator' do
      expect(capitalize_decorator).to be_an_instance_of CapitalizeDecorator
    end
  end
end
describe TrimmerDecorator do
  context 'When testing TrimmerDecorator class' do
    trimmer_decorator = TrimmerDecorator.new('Jimmy')
    it 'should create instance of trimmer_decorator' do
      expect(trimmer_decorator).to be_an_instance_of TrimmerDecorator
    end
  end
end
