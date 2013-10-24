require 'helper'

describe Geoip2::Api::Country do
  describe '#country' do
    before(:all) do
      VCR.use_cassette('get_country') do
        @response = Geoip2.country('62.219.147.28')
      end
    end
    subject { @response }
    it { should be_a ::Hashie::Rash }
    it { should respond_to :country }
    it { should respond_to :continent }
    it { should respond_to :registered_country }
    it { should respond_to :maxmind }
    it { should respond_to :traits }

    it /have an iso_code in country/ do
      expect(subject.country).to include :iso_code
      expect(subject.country.iso_code).to eq 'IL'
    end

    it /has a names array in country/ do
      expect(subject.country).to include :names
      expect(subject.country.names).to be_a ::Hashie::Rash
    end

    it /has a 'en' name and it's value should be Israel/ do
      expect(subject.country.names.en).to eq 'Israel'
    end

    it /has a queries_remaining value in maxmind/ do
      expect(subject.maxmind).to include :queries_remaining
      expect(subject.maxmind.queries_remaining).to eq 995
    end

  end
end