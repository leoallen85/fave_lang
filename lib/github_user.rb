require 'octokit'

class GithubUser
  attr_reader :username

  def initialize(username, client: nil)
    @username = username
    @client = client || Octokit::Client.new(:login => ENV["GITHUB_USERNAME"], :password => ENV["GITHUB_PASSWORD"])
  end

  def favourite_language
    client.repositories(username)
      .map(&:language)
      .each_with_object(Hash.new(0)) { |lang, count| count[lang] += 1 }
      .max_by { |lang, count| count }
      .first
  end

  private

  attr_reader :client
end
