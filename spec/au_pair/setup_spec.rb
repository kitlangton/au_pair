require 'spec_helper'

describe AuPair::Setup do
  describe '#add' do
    context 'the alias has not been assigned' do
      it 'asks for a username' do
        users = instance_double(AuPair::UserStore)
        setup = AuPair::Setup.new(users: users)
        allow(users).to receive(:username_for).with('kit').and_return(nil)

        expect(users).to receive(:ask_username_for).with('kit')
        setup.add 'kit'
      end
    end

    context 'there is an alias assigned' do
      it 'sets up a git remote remote' do
        users = instance_double(AuPair::UserStore, username_for: 'kitlangton')
        repo = instance_double(AuPair::Repo, get_name: 'assignment_1')
        github = instance_double(AuPair::Github)
        setup = AuPair::Setup.new(users: users, github: github, repo: repo)
        expect(github).to receive(:add_remote).with(name: 'kit', username: 'kitlangton', repo: 'assignment_1')
        setup.add 'kit'
      end
    end
  end
end
