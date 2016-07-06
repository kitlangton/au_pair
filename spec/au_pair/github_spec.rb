require 'spec_helper'

describe AuPair::Github do
  describe 'add_remote' do
    it 'adds the git remote for the username and given repo' do
      github = AuPair::Github.new
      github.add_remote(username: 'bob', repo: 'fun_day')
      expect(github.remotes).to match /bob/
      expect(github.remotes).to match %r{https://github.com/bob/fun_day.git}
    end
  end
end
