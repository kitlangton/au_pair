require 'spec_helper'

describe AuPair::Repo do
  describe 'get_name' do
    it 'returns the name of the current directory' do
      repo = AuPair::Repo.new
      expect(repo.get_name).to eq 'au_pair'
    end
  end
end
