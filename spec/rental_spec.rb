require './classes/rental'
require './classes/book'
require './classes/person'

describe Rental do
    context "When testing Rental class" do
        
        rental = Rental.new('22-05-2023', Person.new(15, 'Jam'), Book.new('Harry Potter', 'J.K.Rowlings'))
        
        it "should create instance of rental" do
            expect(rental).to be_an_instance_of Rental
        end

        it "should return name of rental instance" do
            expect(rental.date).to eq '22-05-2023'
        end

        it "should return all instances of Rental classes" do
            expect(Rental.all[0]).to be_an_instance_of Rental
        end
    end
end