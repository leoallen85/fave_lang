require "./favourite_language"
require "vcr"

RSpec.describe FavouriteLanguage, type: :feature do

  before do
    # VCR stops us hitting the API when running tests
    VCR.configure do |c|
      c.cassette_library_dir = 'vcr_cassettes'
      c.hook_into :webmock
    end
  end

  it "finds a user's faovurite language on GitHub" do
    VCR.use_cassette("pitchinvasion repos") do
      result = described_class.run("pitchinvasion")
      expect(result).to include("pitchinvasion's favourite language is Ruby")
    end
  end
end
