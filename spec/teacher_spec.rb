require './classes/teacher'

describe Teacher do
    context "When testing Teacher class" do
        
        teacher = Teacher.new(25, 'Science', 'Jimmy')
        
        it "should create instance of Teacher" do
            expect(teacher).to be_an_instance_of Teacher
        end

        it "should return specialization of Teacher instance" do
            expect(teacher.age).to eq 25
        end

        it "should return true" do
            expect(teacher.can_use_services?).to be true
        end
    end
end