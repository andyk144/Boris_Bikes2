require 'bike'
describe Bike do
  it { is_expected.to respond_to(:working?)  }

  context 'tells us the bike is working' do
    it 'is in working condition' do
      expect(subject.working?).to be_truthy
    end
  end

  context 'tells us the bike is not working' do
    it 'is in non working condition' do
      expect(!subject.working?).to be_falsey
    end
  end
end
