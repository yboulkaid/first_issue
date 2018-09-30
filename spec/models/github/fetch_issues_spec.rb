require 'spec_helper'

RSpec.describe Github::FetchIssues do
  describe '#.call' do
    context 'with a valid repository and label' do
      it 'calls the github issue endpoint and returns a parsed JSON' do
        stubbed_response = [{ id: 1 }, { id: 2 }].to_json
        stub_request(:get, 'https://api.github.com/repos/rails/rails/issues?labels=good-first-patch')
          .to_return(status: 200, body: stubbed_response)

        result = described_class.call(repository: 'rails/rails', label: 'good-first-patch')

        expect(result).to eq([{ id: 1 }, { id: 2 }])
      end
    end
  end
end
