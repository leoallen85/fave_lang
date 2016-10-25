require 'octokit'
require 'pry'

class GithubUser
  attr_reader :username

  def initialize(username, client: nil)
    @username = username
    @client = client || Octokit::Client.new(:login => ENV["GITHUB_USERNAME"], :password => ENV["GITHUB_PASSWORD"])
  end

  def favourite_language
    return "None" if languages.empty?
    find_favourite_language
  end

  private

  attr_reader :client

  def find_favourite_language
    languages
      .each_with_object(counter) { |lang, count| count[lang] += 1 }
      .group_by { |lang, count| count }
      .max_by { |count, lang| count }
      .last
      .map(&:first)
      .join("/")
  end

  def counter
    Hash.new(0)
  end

  def languages
    @languages ||= client.repositories(username).map(&:language).compact
  end
end
