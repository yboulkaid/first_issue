module Github
  class Repositories
    REPOSITORIES = [
      Repository.new(name: 'babel/babel', language: :javascript, first_issue_label: 'good first issue'),
      Repository.new(name: 'webpack/webpack', language: :javascript, first_issue_label: 'D0: My First Commit (Contrib. Difficulty)'),
      Repository.new(name: 'rails/rails', language: :ruby, first_issue_label: 'good-first-patch'),
      Repository.new(name: 'rails/webpacker', language: :ruby, first_issue_label: 'good first issue'),
      Repository.new(name: 'rubocop-hq/rubocop', language: :ruby, first_issue_label: 'good first issue')
    ].freeze

    def self.all_by_language
      REPOSITORIES.group_by(&:language)
    end
  end
end
