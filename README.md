# Favourite Language Finder

This tool allows you to search by someone's GitHub username to work out their
favourite language.

## Installation

1. Clone the repo
2. Run `bundle` to install dependencies
3. Copy the `.env.example` to a .`env` file and add your GitHub username and
   password

## Usage

To run it simply run the command line executable, adding the username that you
want. So to search for Uncle Bob's favourite language we would type in:

```
bin/favourite_language on_github unclebob
```

## Edge Cases

1. If the user has two langauges that they are equally fond of, it will return
   them both
2. If they have no languages it will indicate so
