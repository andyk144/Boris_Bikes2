require 'dockingstation'
describe DockingStation do
  it { is_expected.to respond_to(:release_bike)  }
  it { is_expected.to respond_to(:dock).with(1).argument }
  DEFAULT_CAPACITY = 20


  context 'releasing bike' do

    describe '#release_bike' do
      it 'releases a bike' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
      end
    end

    describe '#release_bike' do
      it 'raises an error when there are no bikes available' do
        expect { subject.release_bike }.to raise_error 'No bikes available'
      end
    end

  end

  context 'docking a bike' do

    it 'docks a bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq ([bike])
    end

    describe 'docking station full' do
      it 'raises an error when docking station is out of capacity' do
        DEFAULT_CAPACITY.times { subject.dock Bike.new }
        bike = Bike.new
        expect { subject.dock(bike) }.to raise_error 'Station full'
      end
    end

  end
end
