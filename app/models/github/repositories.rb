module Github
  class Repositories
    REPOSITORIES = [
      Repository.new(name: 'babel/babel', language: :javascript, first_issue_label: 'good first issue'),
      Repository.new(name: 'rails/rails', language: :ruby, first_issue_label: 'good-first-patch')
    ].freeze

    def self.all_by_language
      REPOSITORIES.group_by(&:language)
    end
  end
end
