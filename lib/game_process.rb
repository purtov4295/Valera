require_relative 'valera'
require_relative 'actions'
require_relative 'saver'

class GameProcess
  attr_accessor :action_item, :valera, :actions_config

  def initialize
    @valera = Valera.new
  end

  def choose_action(stats)
    item = @action_item - 1
    case @action_item
    when 1..7 then stats = Actions.new.action_proc(stats, @actions_config[item])
    when 8 then stats = Saver.saver(stats, 8)
    when 9 then stats = Saver.saver(stats, 9)
    when 10 then exit
    end
    stats
  end

  def do_action
    stats = choose_action(@valera.stats.clone)

    system('clear')
    puts("\nНедопустимое действие! Попробуйте снова") if check_action(stats)
    return false if @valera.stats['health'] <= 0

    valera
  end

  def check_action(stats)
    if @action_item == 1
      mana = @valera.stats['mana']
      tire = @valera.stats['tire']
      correct_stats = @valera.check_stats(stats)
      return (mana >= 50) || (tire >= 10) || (correct_stats == false)
    end

    @valera.check_stats(stats) == false
  end
end
