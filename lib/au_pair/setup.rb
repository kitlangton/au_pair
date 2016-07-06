module AuPair
  class Setup
    def initialize(users: AuPair::UserStore.new, github: AuPair::Github.new, repo: AuPair::Repo.new)
      @users = users
      @github = github
      @repo = repo
    end

    def add(name)
      username = users.username_for(name)
      if username && repo
        github.add_remote(name: name, username: username, repo: repo.get_name)
      else
        users.ask_username_for(name)
      end
    end

    private

    attr_reader :github, :users, :repo
  end
end
