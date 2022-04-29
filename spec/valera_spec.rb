require './lib/valera'

RSpec.describe Valera do
  describe 'Valera' do
    valera = Valera.new
    context 'check_true' do
      stats = {
        'health' => 70,
        'mana' => 10,
        'fun' => -10,
        'tire' => 25,
        'money' => 2500
      }
      it { expect(valera.check_stats(stats)).to eq true }
    end
    context 'check_false' do
      stats = {
        'health' => 100,
        'mana' => 150,
        'fun' => -10,
        'tire' => 25,
        'money' => 2500
      }
      it { expect(valera.check_stats(stats)).to eq false }
    end
    context 'check_false' do
      stats = {
        'health' => 100,
        'mana' => 50,
        'fun' => -102,
        'tire' => 25,
        'money' => 2500
      }
      it { expect(valera.check_stats(stats)).to eq false }
    end
  end
end
