require 'helper'

describe Geoip2::Api::Country do
  describe '#country', version: "2.0" do
    let!(:response) do 
      VCR.use_cassette('get_country') do
        Geoip2.country('62.219.147.28')
      end
    end
    
    [:country, :continent, :registered_country, :maxmind, :traits].each do |met|
      it "response to #{met}" do
        expect(response.respond_to?(met)).to eql(true)
      end
    end

    it "have an iso_code in country" do
      expect(response.country).to include :iso_code
      expect(response.country.iso_code).to eq 'IL'
    end

    it "has a names array in country" do
      expect(response.country).to include :names
      expect(response.country.names).to be_a ::Hashie::Mash
    end

    it "has a 'en' name and it's value should be Israel" do
      expect(response.country.names.en).to eq 'Israel'
    end

    it "has a queries_remaining value in maxmind" do
      expect(response.maxmind).to include :queries_remaining
      expect(response.maxmind.queries_remaining).to eq 995
    end
  end
end
