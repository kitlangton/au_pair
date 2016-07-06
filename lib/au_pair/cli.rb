require "thor"

module AuPair
  class CLI < Thor

    desc "add NAME", "adds git remote for NAME"
    def add(name)
      setup = AuPair::Setup.new
      setup.add name
    end
  end
end
