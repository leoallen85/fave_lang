require "languages"

RSpec.describe Languages do
  it "knows if it is empty" do
    languages = described_class.new([])
    expect(languages).to be_empty
  end

  describe "Favourite language" do
    it "has a favourite language" do
      favourites = ["PHP", "Visual Basic", "Visual Basic"]
      languages = described_class.new(favourites)

      expect(languages.favourite).to eq("Visual Basic")
    end

    it "knows when there are two favourite languages" do
      favourites = ["PHP", "JS"]
      languages = described_class.new(favourites)

      expect(languages.favourite).to eq("PHP/JS")
    end
  end
end
