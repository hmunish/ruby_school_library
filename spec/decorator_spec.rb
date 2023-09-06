require './classes/base_decorator'
require './classes/capitalize_decorator'
require './classes/trimmer_decorator'
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
