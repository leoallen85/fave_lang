require 'octokit'
require 'dotenv'
require './lib/github_user'
require 'pry'

Dotenv.load
Octokit.auto_paginate = true

class FavouriteLanguage
  def self.run(username)
    user = GithubUser.new(username)
    "#{user.username}'s favourite language is #{user.favourite_language}"
  end
end
