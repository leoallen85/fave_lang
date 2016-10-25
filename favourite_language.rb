require 'octokit'
require 'dotenv'

Dotenv.load

class FavouriteLanguage
  def self.run(username)

    client = Octokit::Client.new(:login => ENV["GITHUB_USERNAME"], :password => ENV["GITHUB_PASSWORD"])
    Octokit.auto_paginate = true

    repos = client.repositories(username)
    count = Hash.new(0)

    fave_lang = repos
      .map(&:language)
      .compact
      .each_with_object(count) { |lang, count| count[lang] += 1 }
      .max_by { |lang, count| count }
      .first

    "#{username}'s favourite language is #{fave_lang}"
  end
end
