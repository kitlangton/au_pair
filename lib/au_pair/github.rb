module AuPair
  class Github
    BASEURL = "https://github.com"

    def add_remote(username:, repo:)
      repo_url = "#{BASEURL}/#{username}/#{repo}.git"
      `git remote remove #{username}`
      `git remote add #{username} #{repo_url}`
    end

    def remotes
      `git remote -v`
    end
  end
end
