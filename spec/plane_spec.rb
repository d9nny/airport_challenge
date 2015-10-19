require 'plane'

describe Plane do
	
	context "On initialise" do
		it 'the plane starts flying' do
			expect(subject.flying?).to eq true
		end
	end

	it 'has_landed changes flying to false' do
		subject.land
	  expect(subject.flying?).to eq false
	end

	it 'has_taken off changes flying to false' do
		subject.land
		subject.take_off
	  expect(subject.flying?).to eq true
	end

	it 'is_flying? shows the planes status' do
	  expect(subject.flying?).to eq true
	end
end



