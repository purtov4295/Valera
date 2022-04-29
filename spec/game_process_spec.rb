require './lib/game_process'
require 'yaml'
RSpec.describe GameProcess do
  describe '#GameProcess' do
    stats = {
      'health' => 100,
      'mana' => 0,
      'fun' => 0,
      'tire' => 0,
      'money' => 0
    }
    context 'choose_action' do
      game = GameProcess.new
      expected_stats = {
        'health' => 100,
        'mana' => -30,
        'fun' => -5,
        'tire' => 70,
        'money' => 100
      }
      game.action_item = 1
      game.actions_config = YAML.safe_load(File.read('./actions.yml'))
      it { expect(game.choose_action(stats)).to eq expected_stats }
    end

    context 'do_action' do
      game = GameProcess.new
      expected_stats = {
        'health' => 100,
        'mana' => 0,
        'fun' => -5,
        'tire' => 70,
        'money' => 100
      }
      game.action_item = 1
      game.actions_config = YAML.safe_load(File.read('./actions.yml'))
      it { expect(game.do_action.stats).to eq expected_stats }
    end

    context 'check_action' do
      game = GameProcess.new
      it { expect(game.check_action(stats)).to eq false }
    end
  end
end
