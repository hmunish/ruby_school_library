# rubocop:disable Metrics
require_relative 'app'
class Exe
  def initialize(user_option)
    @app = App.new
    @user_option = user_option
  end

  def exe
    case @user_option

    when 1
      puts @app.list_books
      Main.new.display_ui

    when 2
      puts @app.list_persons
      Main.new.display_ui

    when 3
      print ' Do you want to create a student (1) or a teacher (2) ? [input the number] :'
      person_type = gets.chomp.to_i
      print 'Age: '
      age = gets.chomp.to_i
      print 'Name: '
      name = gets.chomp.to_s
      @app.create_person(name, age, person_type)
      Main.new.display_ui

    when 4
      print 'Title: '
      title = gets.chomp.to_s
      print 'Author: '
      author = gets.chomp.to_s
      @app.create_book(title, author)
      Main.new.display_ui

    when 5
      @app.create_rental
      Main.new.display_ui

    when 6
      @app.list_rentals
      Main.new.display_ui

    when 7
      abort 'Thank you for using the ruby school applicaion'

    else
      puts ' Invalid Option. Please select valid option'
      Main.new.display_ui
    end
  end
end
# rubocop:enable Metrics
