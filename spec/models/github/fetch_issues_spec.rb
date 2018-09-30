require 'spec_helper'

RSpec.describe Github::FetchIssues do
  describe '.call' do
    context 'when the call to Github succeeds' do
      it 'calls the Github issue endpoint and returns a parsed JSON' do
        stubbed_response = [
          { title: 'My Issue 1', body: 'My body', url: 'http://google.com' },
          { title: 'My Issue 2', body: 'Hello world', url: 'http://github.com' }
        ].to_json

        stub_request(:get, 'https://api.github.com/repos/rails/rails/issues?labels=good-first-patch')
          .to_return(status: 200, body: stubbed_response)

        result = described_class.call(repository: 'rails/rails', label: 'good-first-patch')

        expect(result).to eq(
          [
            Github::Issue.new(title: 'My Issue 1', body: 'My body', url: 'http://google.com'),
            Github::Issue.new(title: 'My Issue 2', body: 'Hello world', url: 'http://github.com')
          ]
        )
      end
    end

    context 'when the call to Github fails' do
      it 'raises an exception' do
        stub_request(:get, 'https://api.github.com/repos/invalid_repository/issues?labels=invalid')
          .to_return(status: 404)

        expect { described_class.call(repository: 'invalid_repository', label: 'invalid') }.to(
          raise_error Github::FetchIssues::GithubApiError
        )
      end
    end
  end
end
