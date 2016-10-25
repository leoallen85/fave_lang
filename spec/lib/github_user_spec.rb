require 'github_user'

RSpec.describe GithubUser do
  it "has a username" do
    user = described_class.new("dave")
    expect(user.username).to eq("dave")
  end

  describe "A user's favourite language" do
    it "has a favourite language" do
      visual_basic = double(:language, language: "Visual Basic")
      js = double(:language, language: "JavaScript")

      client = double("Octokit")

      allow(client).to receive(:repositories)
        .with("unclebob")
        .and_return([js, visual_basic, visual_basic])

      user = described_class.new("unclebob", client: client)

      expect(user.favourite_language).to eq("Visual Basic")
    end
  end
end
