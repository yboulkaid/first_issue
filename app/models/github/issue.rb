require 'redcarpet/render_strip'

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

    def parsed_body
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
      markdown.render(body)
    end
  end
end
