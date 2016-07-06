require 'thor'
require 'yaml'

module AuPair
  class UserStore
    DEFAULT_CONFIG_FILE = "#{Dir.home}/.aupair".freeze

    def initialize(config_file: DEFAULT_CONFIG_FILE)
      @config_file = config_file
      File.write(config_file, "") unless File.exists? config_file
      @store = YAML.load(File.read(config_file)) || {}
    end

    def username_for(name)
      @store[name]
    end

    def gets(question)
      Thor::Shell::Basic.new.ask question
    end

    def ask_username_for(name)
      puts "There is no saved username for #{name.capitalize}."
      username = gets "What's #{name.capitalize}'s GitHub username?"
      @store[name] = username
      File.write(@config_file, YAML.dump(@store))
    end
  end
end
