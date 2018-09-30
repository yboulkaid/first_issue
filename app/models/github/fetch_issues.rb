module Github
  class FetchIssues
    def self.call(repository:, label:)
      new(repository: repository, label: label).fetch!
    end

    def initialize(repository:, label:)
      @repository = repository
      @label = label
    end

    def fetch!
      JSON.parse(response.body, symbolize_names: true)
    end

    private

    def response
      @response ||= fetch_response!
    end

    def fetch_response!
      RestClient.get(issues_uri, params: labels_params)
    end

    def issues_uri
      "https://api.github.com/repos/#{repository}/issues"
    end

    def labels_params
      { labels: label }
    end

    attr_reader :repository, :label
  end
end
