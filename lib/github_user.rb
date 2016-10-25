require 'octokit'
require './lib/languages'

class GithubUser
  attr_reader :username

  def initialize(username, client: nil)
    @username = username
    @client = client || Octokit::Client.new(:login => ENV["GITHUB_USERNAME"], :password => ENV["GITHUB_PASSWORD"])
  end

  def favourite_language
    return "None" if languages.empty?
    languages.favourite
  end

  private

  attr_reader :client

  def languages
    @languages ||= find_languages
  end

  def find_languages
    languages = client.repositories(username).map(&:language).compact
    Languages.new(languages)
  end
end
