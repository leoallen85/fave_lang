require 'octokit'
require 'pry'

class GithubUser
  attr_reader :username

  def initialize(username, client: nil)
    @username = username
    @client = client || Octokit::Client.new(:login => ENV["GITHUB_USERNAME"], :password => ENV["GITHUB_PASSWORD"])
  end

  def favourite_language
    languages
      .each_with_object(counter) { |lang, count| count[lang] += 1 }
      .group_by { |lang, count| count }
      .max_by { |count, lang| count }
      .last
      .map(&:first)
      .join("/")
  end

  private

  attr_reader :client

  def counter
    Hash.new(0)
  end

  def languages
    client.repositories(username)
      .map(&:language)
  end
end
