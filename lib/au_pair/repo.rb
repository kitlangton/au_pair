require 'pathname'

module AuPair
  class Repo
    def get_name
      Pathname.new(Dir.pwd).basename.to_s
    end
  end
end
