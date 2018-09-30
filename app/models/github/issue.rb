module Github
  class Issue
    def initialize(title:, body:, url:)
      @title = title
      @body = body
      @url = url
    end

    attr_reader :title, :body, :url

    def ==(other)
      title == other.title &&
        body == other.body &&
        url == other.url
    end
  end
end
