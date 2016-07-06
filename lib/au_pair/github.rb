module AuPair
  class Github
    BASEURL = "https://github.com"

    def add_remote(name:, username:, repo:)
      repo_url = "#{BASEURL}/#{username}/#{repo}.git"
      if has_remote?(name)
        `git remote remove #{name}`
      end
      `git remote add #{name} #{repo_url}`
    end

    def has_remote?(name)
      !!(remotes =~ /^#{name}\s/)
    end

    def remotes
      `git remote -v`
    end
  end
end
