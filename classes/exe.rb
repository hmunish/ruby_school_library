# rubocop:disable Metrics
class Exe
  def initialize(user_option)
    @user_option = user_option
  end

  def exe
    case @user_option

    when 1
      puts App.list_books
      Main.new.display_ui

    when 2
      puts App.list_persons
      Main.new.display_ui

    when 3
      App.create_person
      Main.new.display_ui

    when 4
      App.create_book
      Main.new.display_ui

    when 5
      App.create_rental
      Main.new.display_ui

    when 6
      App.list_rentals
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
