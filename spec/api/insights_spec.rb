require 'helper'
describe Geoip2::Api::Insights, version: "2.1" do
  describe '#insights'do  
    let!(:response) do 
      VCR.use_cassette('insights') do
        Geoip2.insights('0.0.0.0')
      end
    end
    
    %i(country continent registered_country maxmind traits).each do |met|
      it "response to #{met}" do
        expect(response.respond_to?(met)).to eql(true)
      end
    end

    it "response is Rash" do
      expect(response).to be_a_kind_of(::Hashie::Mash)
    end

    it "have an iso_code in country" do
      expect(response.country).to include :iso_code
      expect(response.country.iso_code).to eq 'LV'
    end

    it "has a names array in country" do
      expect(response.country).to include :names
      expect(response.country.names).to be_a ::Hashie::Mash
    end

    it "has a 'en' name and it's value should be Israel" do
      expect(response.country.names.en).to eq 'Latvia'
    end

    it "has a queries_remaining value in maxmind" do
      expect(response.maxmind).to include :queries_remaining
      expect(response.maxmind.queries_remaining).to eq 149995
    end

  end
end