require_relative 'game_process'

class Reader
  def read_action
    loop do
      action_item = gets.chomp.to_i
      return action_item unless (action_item < 1) || (action_item > 10)

      puts('Введите значение в диапозоне от 1 до 10')
    end
  end
end
