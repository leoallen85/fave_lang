require 'github_user'

RSpec.describe GithubUser do
  it "has a username" do
    user = described_class.new("dave")
    expect(user.username).to eq("dave")
  end

  describe "A user's favourite language" do
    let(:visual_basic) { language("Visual Basic") }
    let(:js) { language("JavaScript") }
    let(:none) { language(nil) } # This is how Github tells us there is no language

    it "has a favourite language" do
      client = stub_repos([js, visual_basic, visual_basic, none])
      user = described_class.new("unclebob", client: client)

      expect(user.favourite_language).to eq("Visual Basic")
    end

    it "handles when there is no favourite language" do
      client = stub_repos([none, none])
      user = described_class.new("unclebob", client: client)

      expect(user.favourite_language).to eq("None")
    end

    def stub_repos(languages)
      client = double("Octokit")

      allow(client).to receive(:repositories)
        .with("unclebob")
        .and_return(languages)

      client
    end

    def language(name)
      double(:language, language: name)
    end
  end
end
