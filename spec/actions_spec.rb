require './lib/actions'

require 'yaml'
RSpec.describe Actions do
  describe 'Actions' do
    stats = {
      'health' => 70,
      'mana' => 10,
      'fun' => -10,
      'tire' => 25,
      'money' => 2500
    }
    acts = YAML.safe_load(File.read('./actions.yml'))
    action = Actions.new
    context 'Valera working' do
      expected = {
        'health' => 70,
        'mana' => 10,
        'fun' => -10,
        'tire' => 25,
        'money' => 2500
      }
      it { expect(action.action_proc(stats.clone, acts[0])).to eq expected }
    end
    context 'Valera see nature' do
      expected = {
        'health' => 70,
        'mana' => 0,
        'fun' => -9,
        'tire' => 35,
        'money' => 2500
      }
      it { expect(action.action_proc(stats.clone, acts[1])).to eq expected }
    end
    context 'Valera drink wine and watch TV series' do
      expected = {
        'health' => 65,
        'mana' => 40,
        'fun' => -11,
        'tire' => 35,
        'money' => 2480
      }
      it { expect(action.action_proc(stats.clone, acts[2])).to eq expected }
    end
    context 'Valera go to pub' do
      expected = {
        'health' => 60,
        'mana' => 70,
        'fun' => -9,
        'tire' => 65,
        'money' => 2400
      }
      it { expect(action.action_proc(stats.clone, acts[3])).to eq expected }
    end
    context 'Valera drink with marginals' do
      expected = {
        'health' => -10,
        'mana' => 100,
        'fun' => -5,
        'tire' => 105,
        'money' => 2350
      }
      it { expect(action.action_proc(stats.clone, acts[4])).to eq expected }
    end
    context 'Valera sing in the subway' do
      expected = {
        'health' => 70,
        'mana' => 20,
        'fun' => -9,
        'tire' => 45,
        'money' => 2510
      }
      it { expect(action.action_proc(stats.clone, acts[5])).to eq expected }
    end
    context 'Valera sleep' do
      expected = {
        'health' => 160,
        'mana' => -40,
        'fun' => -10,
        'tire' => -45,
        'money' => 2500
      }
      it { expect(action.action_proc(stats.clone, acts[6])).to eq expected }
    end
  end
end
