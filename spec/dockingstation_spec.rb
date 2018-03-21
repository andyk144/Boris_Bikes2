require 'dockingstation'
describe DockingStation do
  it { is_expected.to respond_to(:release_bike)  }
  it 'returns instance of bike class when called release_bike' do
    expect(DockingStation.new.release_bike).to be_a Bike
  end
  it 'expect bike to working? or not' do
    expect(Bike.new.working?).to eq true
  end
end
