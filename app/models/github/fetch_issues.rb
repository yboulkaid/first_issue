module Github
  class FetchIssues
    GithubApiError = Class.new(StandardError)

    def self.call(repository:, label:)
      new(repository: repository, label: label).fetch!
    end

    def initialize(repository:, label:)
      @repository = repository
      @label = label
    end

    def fetch!
      parsed_body
    end

    private

    def parsed_body
      JSON.parse(response.body, symbolize_names: true)
    end

    def success?
      response.code == 200
    end

    def response
      @response ||= RestClient.get(issues_uri, params: labels_params)
    rescue RestClient::ExceptionWithResponse => e
      raise GithubApiError, e
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
