require 'octokit'
require 'dotenv'
require './lib/github_user'
require 'thor'

Dotenv.load
Octokit.auto_paginate = true

class FavouriteLanguage < Thor
  desc "on_github USERNAME", "Lookup on GitHub by username to find the user's favourite language(s)"
  def on_github(username)
    user = GithubUser.new(username)
    puts "#{user.username}'s favourite language is #{user.favourite_language}"
  end
end
