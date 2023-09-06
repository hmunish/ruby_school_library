require './classes/book'
 
 describe Book do 
    context "When testing the Book class" do 

        book = Book.new('Harry Potter', 'J.K.Rowlings')

        it "should create instance of Book" do
            expect(book).to be_an_instance_of Book
        end
        
        it "should create instance with correct title" do
            expect(book.title).to eq 'Harry Potter'
        end

        it "should create instance with correct author name" do
            expect(book.author).to eq 'J.K.Rowlings'
        end
       
    end
 end