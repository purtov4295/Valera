require './lib/saver'

RSpec.describe Saver do
  describe '#Saver' do
    context 'saver' do
      stats = {
        'health' => 70,
        'mana' => 10,
        'fun' => -10,
        'tire' => 25,
        'money' => 2500
      }
      it {
        allow($stdin).to receive(:gets).and_return('testprofile')
        Saver.saver(stats, 10)
        curr_stats = Saver.saver(stats, 9)
        expect(curr_stats).to eq stats
      }
    end
  end
end
