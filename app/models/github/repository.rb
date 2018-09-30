module Github
  class Repository
    def initialize(name:, language:, first_issue_label:)
      @name = name
      @language = language
      @first_issue_label = first_issue_label
    end

    attr_accessor :name, :language, :first_issue_label
  end
end
