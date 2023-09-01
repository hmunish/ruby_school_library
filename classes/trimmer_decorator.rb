require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    trim_name = @nameable.correct_name[0..9]
    @nameable.correct_name.length > 10 ? trim_name : @nameable.correct_name
  end
end
