require 'spec_helper'

describe AuPair::Github do
  describe 'add_remote' do
    it 'adds the git remote for the username and given repo' do
      github = AuPair::Github.new
      github.add_remote(name: 'bill', username: 'billboy', repo: 'fun_day')
      expect(github.has_remote?('bill')).to eq true
      expect(github.remotes).to match %r{https://github.com/billboy/fun_day.git}
    end
  end

  describe '#has_remote?' do
    it 'returns false if there is no remote' do
      github = AuPair::Github.new
      expect(github.has_remote?('asdoesutha')).to eq false
    end
  end
end
