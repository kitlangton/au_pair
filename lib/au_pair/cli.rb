require "thor"

module AuPair
  class CLI < Thor

    desc "add NAME", "adds git remote for NAME"
    def add(name)
      setup = AuPair::Setup.new
      setup.add name
      puts "You can now pull from #{name.capitalize}'s repo with 'git pull #{name} master'"
    end
  end
end
