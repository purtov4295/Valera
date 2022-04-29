require_relative 'game_process'
require_relative 'viewer'
require_relative 'reader'
require 'yaml'

class Application
  def initialize
    @game = GameProcess.new
    @viewer = Viewer.new
    @valera = Valera.new
    @reader = Reader.new
  end

  def dead_valera
    puts('Валера умер! Конец игры')
    puts('q - выход, Enter - начало новой игры')
    input = gets.chomp
    if input == ''
      load './main.rb'
    else
      exit
    end
  end

  def start
    @game.actions_config = YAML.safe_load(File.read('./actions.yml'))
    loop do
      @viewer.print_stats(@valera.stats)
      @viewer.print_actions(@game.actions_config)

      @game.action_item = @reader.read_action

      @valera = @game.do_action
      next unless @valera == false

      dead_valera
    end
  end
end
