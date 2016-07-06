require 'spec_helper'

describe AuPair::UserStore do
  let(:config_file) { "spec/fixtures/aupair.yml" }

  before do
    File.write(config_file, "kit: kitlangton")
  end

  describe '#username_for' do
    context 'config file does not exist' do
      let(:nothing) { "spec/fixtures/nothing.yml" }

      before do
        if File.exists?(nothing)
          File.delete(nothing)
        end
      end

      it 'creates the config file' do
        store = AuPair::UserStore.new(config_file: "spec/fixtures/nothing.yml")
        expect(File.exists?(nothing)).to eq true
      end
    end

    context 'the username exists' do
      it 'retrieves the username for a given user' do
        store = AuPair::UserStore.new(config_file: config_file)
        username = store.username_for 'kit'
        expect(username).to eq 'kitlangton'
      end
    end

    context 'the username does not exist' do
      it 'retrieves the username for a given user' do
        store = AuPair::UserStore.new(config_file: config_file)
        username = store.username_for 'bobby'
        expect(username).to eq nil
      end
    end
  end

  describe '#ask_username_for' do
    it 'prompts for a username and adds that username to the config' do
      store = AuPair::UserStore.new(config_file: config_file)
      allow(store).to receive(:gets).and_return('eriktrautman')
      store.ask_username_for('erik')
      expect(store.username_for('erik')).to eq 'eriktrautman'
    end
  end
end
